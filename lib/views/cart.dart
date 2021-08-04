import 'package:flutter/material.dart';
import 'package:leeta/models/cart_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/checkout.dart';
import 'package:leeta/views/login.dart';
import 'package:leeta/widgets/variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var list = <CartModel>[];
  bool isLoading = false;
  String currencySymbol = "";
  double totalAmount = 0.0;
  bool isLoggedIn = false;

  void fetchList() async {
    setState(() {
      isLoading = true;
    });
    try {
      var data = await ApiProvider.fetchCartItems();
      if (data != null) {
        if (data.length > 0) currencySymbol = data[0].currencySymbol!;
        setState(() {
          list = data;
        });
        data.forEach((element) {
          setState(() {
            totalAmount = totalAmount + element.totalAmount!;
          });
        });
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void removeFromCart(id) async {
    var response = await ApiProvider.removeFromCart(id.toString());
    fetchList();
    print(response);
  }

  Future<void> clearCart() async {
    var response = await ApiProvider.clearCart();
    fetchList();
    print(response);
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
        title: Text('Cart'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 120),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        isLoading
                            ? Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(THEME_COLOR),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: list.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: UniqueKey(),
                                    background: Container(
                                      color: THEME_COLOR,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '  Remove',
                                            style: STD_TEXT_STYLE,
                                          ),
                                          Text(
                                            'Remove  ',
                                            style: STD_TEXT_STYLE,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onDismissed: (direction) {
                                      removeFromCart(list[index].id);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Removed from cart',
                                          style: SNACKBAR_TEXT_STYLE,
                                        ),
                                        duration: Duration(seconds: 2),
                                      ));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(4),
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                list[index]
                                                    .qty
                                                    .toStringAsFixed(0),
                                                style: STD_TEXT_STYLE.copyWith(
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Icon(
                                                Icons.clear,
                                                color: BLACK,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        list[index]
                                                            .productName!,
                                                        style: STD_TEXT_STYLE
                                                            .copyWith(
                                                                fontSize: 14,
                                                                wordSpacing:
                                                                    1.5),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          leading: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: BLACK),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    list[index].productImgPath!,
                                                    height: 40,
                                                    width: 40,
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                          trailing: Text(
                                            list[index].currencySymbol! +
                                                list[index]
                                                    .totalAmount!
                                                    .toStringAsFixed(2),
                                            style: STD_TEXT_STYLE.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          // onTap: () async {
                                          //   var product = await ApiProvider
                                          //       .getProductById(list[index]
                                          //           .productId
                                          //           .toString());
                                          //   if (product != null) {
                                          //     Navigator.of(context).push(
                                          //         new MaterialPageRoute(
                                          //             builder: (context) =>
                                          //                 DetailsPage(
                                          //                     product:
                                          //                         product)));
                                          //   }
                                          // },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                        ListTile(
                          contentPadding: EdgeInsets.all(5),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/icons/delievery-icon.png"),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery',
                                style: STD_TEXT_STYLE.copyWith(
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                'All orders for home delivery will cost ${currencySymbol}10.00 more',
                                style: STD_TEXT_STYLE.copyWith(
                                  fontSize: 10,
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 130,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: totalAmount < 40
                                          ? totalAmount / 40
                                          : 1,
                                      valueColor:
                                          AlwaysStoppedAnimation(THEME_COLOR),
                                      backgroundColor: GREY,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total :",
                          style: STD_TEXT_STYLE.copyWith(fontSize: 18),
                        ),
                        Text(
                          currencySymbol + totalAmount.toStringAsFixed(2),
                          style: STD_TEXT_STYLE.copyWith(fontSize: 30),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                            onPressed: list.length == 0
                                ? null
                                : () async {
                                    showdialog(false);
                                    clearCart().then((value) {
                                      Navigator.pop(context);
                                      showdialog(true);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Your cart successfully cleared'),
                                        duration: Duration(seconds: 2),
                                      ));
                                    });
                                  },
                            child: Text('Clear Cart')),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: IS_LOGGED_IN && list.length == 0
                                ? null
                                : () {
                                    IS_LOGGED_IN
                                        ? Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    CheckoutPage(
                                                      list: list,
                                                    )))
                                        : Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(13),
                              primary: THEME_COLOR,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              IS_LOGGED_IN ? 'Checkout' : 'Login To Proceed',
                              style: STD_TEXT_STYLE.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showdialog(bool isProcessing) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isProcessing ? 'Cleared' : 'Processing',
              style: STD_TEXT_STYLE,
            ),
            content: isProcessing
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Your cart successfully cleared',
                        style: ALERT_TEXT_STYLE,
                      )
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
            actions: isProcessing
                ? [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Continue"))
                  ]
                : null,
          );
        });
  }
}
