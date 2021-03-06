import 'package:flutter/material.dart';
import 'package:leeta/models/product_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/details.dart';
import 'package:leeta/widgets/variables.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var list = <ProductModel>[];
  var filteredList = <ProductModel>[];
  bool _isLoading = true;
  final txtSearch = new TextEditingController();

  void fetchList() async {
    try {
      var data = await ApiProvider.fetchProductsForSearch();
      if (data != null) {
        list = data;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  search(String value) {
    if (value.isEmpty) {
      setState(() {
        filteredList = <ProductModel>[];
      });
      return;
    }
    setState(() {
      filteredList = list
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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
          elevation: 0,
          centerTitle: false,
          title: Text('Ara'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : bodyWidget());
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: BLACK.withOpacity(0.32),
              ),
            ),
            child: TextField(
              controller: txtSearch,
              autofocus: true,
              onChanged: search,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(color: BLACK),
              ),
            ),
          ),
          filteredList.length > 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                  child: Text(
                    "Products",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : Center(),
          GridView.count(
            padding: const EdgeInsets.all(20.0),
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            childAspectRatio: 0.8,
            physics: ClampingScrollPhysics(),
            children: List.generate(filteredList.length, (index) {
              return productCard(filteredList[index]);
            }),
          ),
        ],
      ),
    );
  }

  Widget productCard(ProductModel product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(product: product),
          ),
        );
      },
      child: Card(
        color: LIGHT_GREY,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: product.id.toString(),
                        child: Image.network(
                          product.imgPath!,
                          fit: BoxFit.fill,
                          width: 200,
                          // placeholder: (context, url) => Container(
                          //     color: WHITE,
                          //     child: Center(
                          //         child: Icon(
                          //       Icons.image,
                          //       color: LIGHT_GREY,
                          //       size: 35,
                          //     ))),
                          // errorWidget: (context, url, error) => Container(
                          //     color: WHITE,
                          //     child: Center(
                          //         child: Icon(
                          //       Icons.error,
                          //       color: LIGHT_GREY,
                          //       size: 35,
                          //     ))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    product.currencySymbol! +
                        product.unitPrice.toStringAsFixed(2),
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        fontSize: 24,
                        color: BLACK,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: BLACK,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
