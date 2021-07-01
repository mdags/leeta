import 'package:flutter/material.dart';
import 'package:leeta/widgets/variables.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var favourites = <Favourites>[];
  var list = <Favourites>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  read() async {
    // setState(() {
    //   list.clear();
    // });
    // await favourites.readingDatabase().then((value) {
    //   setState(() {
    //     list.addAll(value);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: list == null
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
            Container(
              color: WHITE,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Favourites',
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: BLACK,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget favouriteItem(int i) {
    return InkWell(
      onTap: () async {
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
                        child: Text(
                          list[i].name.substring(0, 1),
                          style: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: GREY,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      list[i].name,
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
                      "{list[i].price}",
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
                  // favourites.removeFromFavourites(list[i].id);
                  // setState(() {
                  //   list.clear();
                  //   read();
                  // });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Favourites {
  int id;
  String name;
  String price;
  String image;
  String description;

  Favourites.constuctor(
      this.id, this.name, this.price, this.image, this.description);
}
