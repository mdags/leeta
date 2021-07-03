import 'package:flutter/material.dart';
import 'package:leeta/models/favourite_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/details.dart';
import 'package:leeta/widgets/variables.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool isLoading = false;
  var list = <FavouriteModel>[];

  void fetchList() async {
    setState(() {
      isLoading = true;
    });

    try {
      var data = await ApiProvider.fetchFavourites();
      if (data != null) {
        list = data;
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void setFavourite(productId) async {
    var response = await ApiProvider.setFavourite(productId.toString());
    print(response);
    fetchList();
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(THEME_COLOR),
                        ),
                      )
                    : GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: List.generate(list.length, (index) {
                          return favouriteItem(index);
                        }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favouriteItem(int i) {
    return InkWell(
      onTap: () async {
        var product =
            await ApiProvider.getProductById(list[i].productId.toString());
        if (product != null) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => DetailsPage(product: product)));
        }
        // bool res = await Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
        //     "",
        //     "",
        //     "",
        //     "",
        //     list[i].id)));
        // if(res!= null && res){
        //   read();
        // }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: LIGHT_GREY),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: GREY)),
                      child: Center(
                        child: Image.network(list[i].productImgPath),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      list[i].productName,
                      style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: BLACK,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      list[i].currencySymbol +
                          list[i].productPrice.toStringAsFixed(2),
                      style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: BLACK,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/delete.png',
                  height: 15,
                  width: 15,
                  color: BLACK,
                ),
                onPressed: () {
                  setFavourite(list[i].productId);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
