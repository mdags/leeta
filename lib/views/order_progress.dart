import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leeta/models/order_modal.dart';
import 'package:leeta/widgets/variables.dart';

class OrderProgressPage extends StatefulWidget {
  final OrderModel order;

  const OrderProgressPage({Key? key, required this.order}) : super(key: key);

  @override
  _OrderProgressPageState createState() => _OrderProgressPageState();
}

class _OrderProgressPageState extends State<OrderProgressPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order No. - ${widget.order.id}",
        ),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 8, 8, 10),
              decoration: BoxDecoration(
                color: LIGHT_GREY,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order No.: " + widget.order.id.toString(),
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
                              "Order Date.: " +
                                  DateFormat("dd.MM.yyyy HH:mm")
                                      .format(widget.order.createdDate!),
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
                              widget.order.orderDetails![0].currencySymbol! +
                                  widget.order.totalAmount!.toStringAsFixed(2),
                              style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Container(
                        //   height: 30,
                        //   width: 100,
                        //   //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        //   decoration: BoxDecoration(
                        //       borderRadius:
                        //           BorderRadius.circular(
                        //               15),
                        //       border: Border.all(
                        //           color: GREY)),
                        //   child: Center(
                        //       child: Text(
                        //     list[index].orderStatus ?? "",
                        //     style: TextStyle(
                        //         fontFamily: 'GlobalFonts',
                        //         color: BLACK,
                        //         fontSize: 12),
                        //   )),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.order.contactAddress == null
                          ? 'Pickup Order'
                          : widget.order.contactAddress!,
                      style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: GREY,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: widget.order.orderDetails!.length,
                itemBuilder: (context, index) {
                  return itemWidget(widget.order.orderDetails![index]);
                }),
          ],
        ),
      ),
      // SafeArea(
      //   child: loading
      //       ? Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : Padding(
      //           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: LIGHT_GREY,
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       SizedBox(
      //                         height: 10,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(20),
      //                         child: ListView.builder(
      //                             itemCount: 1,
      //                             shrinkWrap: true,
      //                             physics: ClampingScrollPhysics(),
      //                             itemBuilder: (context, index) {
      //                               return Column(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.start,
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 children: [
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: [
      //                                       Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Text(
      //                                             "Item name",
      //                                             style: TextStyle(
      //                                               fontFamily: 'GlobalFonts',
      //                                               color: BLACK,
      //                                               fontSize: 13,
      //                                               fontWeight: FontWeight.bold,
      //                                             ),
      //                                           ),
      //                                           SizedBox(
      //                                             height: 10,
      //                                           ),
      //                                           Text(
      //                                             double.parse("0")
      //                                                 .toStringAsFixed(2),
      //                                             style: TextStyle(
      //                                                 fontFamily: 'GlobalFonts',
      //                                                 color: BLACK,
      //                                                 fontSize: 25,
      //                                                 fontWeight:
      //                                                     FontWeight.bold),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               );
      //                             }),
      //                       ),
      //                       Divider(
      //                         height: 10,
      //                         thickness: 0.5,
      //                         color: GREY,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: Row(
      //                           children: [
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     orderProcessClass.orderDetails[0]
      //                                             .orderPlacedDate ??
      //                                         "",
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY,
      //                                         fontWeight: FontWeight.bold,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 10),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 5,
      //                                   ),
      //                                   Text(
      //                                     'Order Accepted',
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY.withOpacity(0.7),
      //                                         fontWeight: FontWeight.w900,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 8),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     orderProcessClass.orderDetails[0]
      //                                             .preparingDateTime ??
      //                                         "",
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY,
      //                                         fontWeight: FontWeight.bold,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 10),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 5,
      //                                   ),
      //                                   Text(
      //                                     'Preparing',
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY.withOpacity(0.7),
      //                                         fontWeight: FontWeight.w900,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 8),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     orderProcessClass.orderDetails[0]
      //                                             .dispatchedDateTime ??
      //                                         "",
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY,
      //                                         fontWeight: FontWeight.bold,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 10),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 5,
      //                                   ),
      //                                   Text(
      //                                     'Arriving Soon',
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY.withOpacity(0.7),
      //                                         fontWeight: FontWeight.w900,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 8),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     orderProcessClass.orderDetails[0]
      //                                             .deliveredDateTime ??
      //                                         "",
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY,
      //                                         fontWeight: FontWeight.bold,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 10),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 5,
      //                                   ),
      //                                   Text(
      //                                     'Delivered',
      //                                     style: TextStyle(
      //                                         fontFamily: 'GlobalFonts',
      //                                         color: GREY.withOpacity(0.7),
      //                                         fontWeight: FontWeight.w900,
      //                                         letterSpacing: 0.8,
      //                                         fontSize: 8),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 10,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: Row(
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Image.asset(
      //                                     orderProcessClass.orderDetails[0]
      //                                                 .placeStatus ==
      //                                             "Activate"
      //                                         ? "assets/icons/placed_active.png"
      //                                         : "assets/icons/placed.png",
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                               child: Container(
      //                                 decoration: BoxDecoration(
      //                                   color: BLACK,
      //                                   border: Border.all(
      //                                       color: Colors.grey.shade800,
      //                                       width: 1),
      //                                 ),
      //                               ),
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Image.asset(
      //                                     orderProcessClass.orderDetails[0]
      //                                                 .preparingStatus ==
      //                                             "Activate"
      //                                         ? "assets/icons/prepared_active.png"
      //                                         : "assets/icons/prepared.png",
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                               child: Container(
      //                                 decoration: BoxDecoration(
      //                                   color: BLACK,
      //                                   border: Border.all(
      //                                       color: Colors.grey.shade800,
      //                                       width: 1),
      //                                 ),
      //                               ),
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Image.asset(orderProcessClass
      //                                               .orderDetails[0]
      //                                               .dispatchedStatus ==
      //                                           "Activate"
      //                                       ? "assets/icons/dispatching_active.png"
      //                                       : "assets/icons/dispatching.png"),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               width: 10,
      //                               child: Container(
      //                                 decoration: BoxDecoration(
      //                                   color: BLACK,
      //                                   border:
      //                                       Border.all(color: GREY, width: 1),
      //                                 ),
      //                               ),
      //                             ),
      //                             Expanded(
      //                               child: Column(
      //                                 children: [
      //                                   Image.asset(
      //                                     orderProcessClass.orderDetails[0]
      //                                                 .deliveredStatus ==
      //                                             "Activate"
      //                                         ? "assets/icons/delieverd_active.png"
      //                                         : "assets/icons/delieverd.png",
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 20,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      // ),
    );
  }

  Widget itemWidget(OrderDetailModel item) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: LIGHT_GREY,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.productName!,
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
                              item.currencySymbol! +
                                  item.unitPrice.toStringAsFixed(2),
                              style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 0.5,
                color: GREY,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            item.acceptedDate!.isNotEmpty
                                ? DateFormat("HH:mm")
                                    .format(DateTime.parse(item.acceptedDate!))
                                : "",
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
                            'Order Accepted',
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
                            item.preparingDate!.isNotEmpty
                                ? DateFormat("HH:mm")
                                    .format(DateTime.parse(item.preparingDate!))
                                : "",
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
                            'Preparing',
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
                            item.arrivingDate!.isNotEmpty
                                ? DateFormat("HH:mm")
                                    .format(DateTime.parse(item.arrivingDate!))
                                : "",
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
                            'Arriving Soon',
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
                            item.deliveredDate!.isNotEmpty
                                ? DateFormat("HH:mm")
                                    .format(DateTime.parse(item.deliveredDate!))
                                : "",
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
                            'Delivered',
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
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            item.acceptedDate!.isNotEmpty
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
                          border:
                              Border.all(color: Colors.grey.shade800, width: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            item.preparingDate!.isNotEmpty
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
                          border:
                              Border.all(color: Colors.grey.shade800, width: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(item.arrivingDate!.isNotEmpty
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
                            item.deliveredDate!.isNotEmpty
                                ? "assets/icons/delieverd_active.png"
                                : "assets/icons/delieverd.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
