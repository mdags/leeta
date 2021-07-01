import 'package:flutter/material.dart';
import 'package:leeta/views/order_history.dart';
import 'package:leeta/widgets/variables.dart';

class OrderProgressPage extends StatefulWidget {
  final String id;

  const OrderProgressPage({Key? key, required this.id}) : super(key: key);

  @override
  _OrderProgressPageState createState() => _OrderProgressPageState();
}

class _OrderProgressPageState extends State<OrderProgressPage> {
  late OrderProcessClass orderProcessClass;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var details = <OrderDetails>[];
    details.add(new OrderDetails(
      orderPlacedDate: " ",
      preparingDateTime: " ",
      dispatchedDateTime: " ",
      address: " ",
      cancelDateTime: " ",
      contact: " ",
      deliveredDateTime: " ",
      deliveredStatus: " ",
      deliveryCharges: " ",
      deliveryMode: " ",
      dispatchedStatus: " ",
      itemOrder: 1,
      orderStatus: " ",
      placeStatus: "Activate",
      preparingStatus: "Activate",
      tax: "0",
      totalPrice: "0",
    ));

    orderProcessClass = new OrderProcessClass(orderDetails: details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      orderProcessClass.orderDetails[0]
                                              .orderPlacedDate ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'ORDER_PLACED',
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.8,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      orderProcessClass.orderDetails[0]
                                              .preparingDateTime ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'PREPARING',
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.8,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      orderProcessClass.orderDetails[0]
                                              .dispatchedDateTime ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'DISPATCHING',
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.8,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      orderProcessClass.orderDetails[0]
                                              .deliveredDateTime ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'DELIVERED',
                                      style: TextStyle(
                                          fontFamily: 'GlobalFonts',
                                          color: GREY.withOpacity(0.7),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.8,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      orderProcessClass.orderDetails[0]
                                                  .placeStatus ==
                                              "Activate"
                                          ? "assets/icons/placed_active.png"
                                          : "assets/icons/placed.png",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BLACK,
                                    border: Border.all(
                                        color: Colors.grey.shade800, width: 1),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      orderProcessClass.orderDetails[0]
                                                  .preparingStatus ==
                                              "Activate"
                                          ? "assets/icons/prepared_active.png"
                                          : "assets/icons/prepared.png",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BLACK,
                                    border: Border.all(
                                        color: Colors.grey.shade800, width: 1),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(orderProcessClass
                                                .orderDetails[0]
                                                .dispatchedStatus ==
                                            "Activate"
                                        ? "assets/icons/dispatching_active.png"
                                        : "assets/icons/dispatching.png"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BLACK,
                                    border: Border.all(color: GREY, width: 1),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      orderProcessClass.orderDetails[0]
                                                  .deliveredStatus ==
                                              "Activate"
                                          ? "assets/icons/delieverd_active.png"
                                          : "assets/icons/delieverd.png",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: LIGHT_GREY,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orderProcessClass.orderDetails[0]
                                                    .orderPlacedDate ??
                                                "",
                                            style: TextStyle(
                                              fontFamily: 'GlobalFonts',
                                              color: BLACK,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            orderProcessClass
                                                    .orderDetails[0].contact ??
                                                "",
                                            style: TextStyle(
                                                fontFamily: 'GlobalFonts',
                                                color: BLACK,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          double.parse(orderProcessClass
                                                      .orderDetails[0]
                                                      .totalPrice ??
                                                  "0")
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              fontFamily: 'GlobalFonts',
                                              color: BLACK,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Text(
                                    orderProcessClass.orderDetails[0].address ==
                                            null
                                        ? 'ORDER_FOR_PICKUP'
                                        : orderProcessClass
                                                .orderDetails[0].address ??
                                            "",
                                    style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: GREY,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 0.5,
                                  color: GREY,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(20),
                                //   child: ListView.builder(
                                //       itemCount: orderProcessClass
                                //           .orderDetails[0].menu!.length,
                                //       shrinkWrap: true,
                                //       physics: ClampingScrollPhysics(),
                                //       itemBuilder: (context, index) {
                                //         return Column(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment
                                //                       .spaceBetween,
                                //               children: [
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Text(
                                //                       orderProcessClass
                                //                               .orderDetails[0]
                                //                               .menu![index]
                                //                               .itemName ??
                                //                           "",
                                //                       style: TextStyle(
                                //                         fontFamily:
                                //                             'GlobalFonts',
                                //                         color: BLACK,
                                //                         fontSize: 13,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       height: 10,
                                //                     ),
                                //                     Text(
                                //                       double.parse(orderProcessClass
                                //                                   .orderDetails[
                                //                                       0]
                                //                                   .menu![index]
                                //                                   .itemTotalPrice ??
                                //                               "0")
                                //                           .toStringAsFixed(2),
                                //                       style: TextStyle(
                                //                           fontFamily:
                                //                               'GlobalFonts',
                                //                           color: BLACK,
                                //                           fontSize: 25,
                                //                           fontWeight:
                                //                               FontWeight.bold),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(
                                //               height: 15,
                                //             ),
                                //             Container(
                                //               child: Wrap(
                                //                 children: List.generate(
                                //                     orderProcessClass
                                //                         .orderDetails[0]
                                //                         .menu![index]
                                //                         .topping!
                                //                         .length, (i) {
                                //                   return Text(
                                //                     orderProcessClass
                                //                             .orderDetails[0]
                                //                             .menu![index]
                                //                             .topping![i]
                                //                             .name ??
                                //                         "",
                                //                     style: TextStyle(
                                //                         fontFamily:
                                //                             'GlobalFonts',
                                //                         fontSize: 12,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                         color: GREY),
                                //                   );
                                //                 }),
                                //                 spacing: 2,
                                //                 runSpacing: 0,
                                //                 alignment: WrapAlignment.start,
                                //               ),
                                //             ),
                                //             Divider(
                                //               thickness: 0.2,
                                //               height: 40,
                                //               color: GREY,
                                //             ),
                                //           ],
                                //         );
                                //       }),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'SHIPPING_CHARGE',
                                        style: TextStyle(
                                            fontFamily: 'GlobalFonts',
                                            color: BLACK,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        orderProcessClass.orderDetails[0]
                                                .deliveryCharges ??
                                            "0",
                                        style: TextStyle(
                                            fontFamily: 'GlobalFonts',
                                            color: GREY.withOpacity(0.7),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
                          "ORDER_NUMBER - ${widget.id}",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
