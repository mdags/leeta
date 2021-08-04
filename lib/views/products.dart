import 'package:flutter/material.dart';
import 'package:leeta/models/category_model.dart';
import 'package:leeta/models/product_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/details.dart';
import 'package:leeta/widgets/variables.dart';

class ProductsPage extends StatefulWidget {
  final CategoryModel category;
  const ProductsPage({Key? key, required this.category}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  var list = <ProductModel>[];
  bool _isLoading = false;

  void fetchList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await ApiProvider.fetchProducts(widget.category.id.toString());
      if (data != null) {
        list = data;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        title: Text("Products"),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              padding: const EdgeInsets.all(20.0),
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              childAspectRatio: 0.8,
              physics: ClampingScrollPhysics(),
              children: List.generate(list.length, (index) {
                return productCard(list[index]);
              }),
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
