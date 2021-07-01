import 'package:flutter/material.dart';
import 'package:leeta/views/checkout.dart';
import 'package:leeta/widgets/variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartITems = <CartITems>[];
  var list = <CartITems>[];
  double totalPrice = 0.0;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 120),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          list == []
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
                                              '  REMOVE',
                                              style: TextStyle(
                                                  fontFamily: 'GlobalFonts',
                                                  color: BLACK,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'REMOVE  ',
                                              style: TextStyle(
                                                  fontFamily: 'GlobalFonts',
                                                  color: BLACK,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        // print(index);
                                        // cartITems
                                        //     .removeFromCart(list[index].itemId)
                                        //     .then((value) {
                                        //   Scaffold.of(context).showSnackBar(
                                        //     SnackBar(
                                        //       content: Text(
                                        //         'REMOVED_FROM_CART',
                                        //         style: TextStyle(
                                        //           fontFamily: 'GlobalFonts',
                                        //           color: BLACK,
                                        //         ),
                                        //       ),
                                        //       backgroundColor: WHITE,
                                        //     ),
                                        //   );
                                        //   read();
                                        // });
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  list[index].itemQty,
                                                  style: TextStyle(
                                                      fontFamily: 'GlobalFonts',
                                                      color: WHITE,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Icon(
                                                  Icons.clear,
                                                  color: WHITE,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          list[index].itemName,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'GlobalFonts',
                                                            color: WHITE,
                                                            fontSize: 14,
                                                            wordSpacing: 1.5,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        // list[index]
                                                        //             .toppings
                                                        //             .length ==
                                                        //         0
                                                        //     ? Container()
                                                        //     : Container(
                                                        //         child: Wrap(
                                                        //           children: List.generate(
                                                        //               list[index]
                                                        //                   .toppings
                                                        //                   .length,
                                                        //               (i) {
                                                        //             return Text(
                                                        //               "toppingName",
                                                        //               style:
                                                        //                   TextStyle(
                                                        //                 fontFamily:
                                                        //                     'GlobalFonts',
                                                        //                 color:
                                                        //                     THEME_COLOR,
                                                        //                 fontSize:
                                                        //                     10,
                                                        //                 fontWeight:
                                                        //                     FontWeight.bold,
                                                        //                 //color: Colors.deepOrange.shade100
                                                        //               ),
                                                        //             );
                                                        //           }),
                                                        //           spacing: 2,
                                                        //           runSpacing: 0,
                                                        //           alignment:
                                                        //               WrapAlignment
                                                        //                   .start,
                                                        //         ),
                                                        //       ),
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
                                                  color: WHITE),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      list[index].image,
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                            ),
                                            trailing: Text(
                                              "${double.parse(list[index].itemTotalPrice).toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontFamily: 'GlobalFonts',
                                                color: WHITE,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.all(4),
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
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5),
                                ),
                                Text(
                                  'All orders for home delivery will cost 10.00 more',
                                  style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    fontSize: 10,
                                    height: 1.4,
                                    fontWeight: FontWeight.bold,
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
                                        value: totalPrice < 40
                                            ? totalPrice / 40
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
                            style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "253.09",
                            style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => CheckoutPage()));
                                // List<FoodDescription> fdList = List();
                                // int i = 0;
                                // isLoggedIn
                                //     ? list.length == 0
                                //         ? showdialog()
                                //         : Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     CheckOutPage(
                                //                         totalPrice, list)))
                                //     : Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 LoginAsCustomer()));
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(13),
                                primary: THEME_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                isLoggedIn ? 'Checkout' : 'Login To Proceed',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
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
            Container(
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
                    'Cart',
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
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

  showdialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'EMPTY_CART',
              style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'IN_ORDER_TO_PROCEED_YOU_NEED_TO_ADD_ITEMS_IN_CART',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: BLACK,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: THEME_COLOR,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class CartITems {
  String itemQty;
  String itemName;
  String itemTotalPrice;
  String image;
  String itemAmt;
  String itemId;

  CartITems(this.itemQty, this.itemName, this.itemTotalPrice, this.image,
      this.itemAmt, this.itemId);
}
