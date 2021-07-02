import 'package:flutter/material.dart';
import 'package:leeta/models/product_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/cart.dart';
import 'package:leeta/widgets/variables.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel product;

  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  double actualPrice = 10;
  bool isFavourite = false;

  void setFavourite() async {
    var response = await ApiProvider.setFavourite(widget.product.id.toString());
    print(response);
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  Future<void> setCart() async {
    var response = await ApiProvider.setCart(
        widget.product.id.toString(), quantity.toString());
    if (!response.contains("err:")) {
      widget.product.cartCount = quantity;
    }
    print(response);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavourite = widget.product.isFavourite == 1 ? true : false;
      quantity = widget.product.cartCount == 0 ? 1 : widget.product.cartCount!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: widget.product.id.toString(),
                              child: Image.network(
                                widget.product.imgPath!,
                                height: 200,
                                // placeholder: (context, url) => Icon(
                                //   Icons.image,
                                //   color: LIGHT_GREY,
                                // ),
                                // errorWidget: (context, url, error) =>
                                //     Icon(Icons.error),
                                // width: MediaQuery.of(context)
                                //         .size
                                //         .width -
                                //     50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product.name,
                                    style:
                                        STD_TEXT_STYLE.copyWith(fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: GREY.withOpacity(0.5),
                                          width: 1)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Image.asset(
                                            "assets/icons/minus.png",
                                            height: 12,
                                            width: 12,
                                            fit: BoxFit.contain,
                                            color: BLACK,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) {
                                                quantity -= 1;
                                              }
                                            });
                                          }),
                                      Text(
                                        quantity.toString(),
                                        style: STD_TEXT_STYLE.copyWith(
                                            fontSize: 17),
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Image.asset(
                                            "assets/icons/plus.png",
                                            height: 12,
                                            width: 12,
                                            fit: BoxFit.contain,
                                            color: BLACK,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              quantity += 1;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                                Text(
                                  widget.product.currencySymbol! +
                                      widget.product.unitPrice
                                          .toStringAsFixed(2),
                                  style: STD_TEXT_STYLE.copyWith(fontSize: 30),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.product.description!,
                              style: STD_TEXT_STYLE.copyWith(
                                  color: GREY, fontSize: 12, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: WHITE,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setFavourite();
                        },
                        child: isFavourite
                            ? Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: 40,
                              )
                            : Icon(
                                Icons.star_border_rounded,
                                size: 40,
                              )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showdialog(false);
                          setCart().then((value) {
                            Navigator.pop(context);
                            showdialog(true);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Product added to cart',
                                style: SNACKBAR_TEXT_STYLE,
                              ),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: THEME_COLOR,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Add To Cart',
                              style: STD_TEXT_STYLE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showdialog(bool isAdded) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isAdded ? 'Added' : 'Processing',
              style: STD_TEXT_STYLE,
            ),
            content: isAdded
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$quantity ${widget.product.name}, successfully added to cart',
                        style: ALERT_TEXT_STYLE,
                      )
                    ],
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            actions: isAdded
                ? [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Add more',
                        style: ALERT_BUTTON_TEXT_STYLE.copyWith(
                            color: THEME_COLOR),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage()));
                      },
                      child: Text(
                        'Checkout',
                        style: ALERT_BUTTON_TEXT_STYLE,
                      ),
                      style: TextButton.styleFrom(
                        primary: THEME_COLOR,
                      ),
                    ),
                  ]
                : null,
          );
        });
  }
}
