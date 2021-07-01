import 'package:flutter/material.dart';
import 'package:leeta/views/order_progress.dart';
import 'package:leeta/widgets/variables.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  var list = <BookOrderClass>[];
  String? userId;
  //List<String> orderStatus = List();
  OrderProcessClass? orderProcessClass;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(new BookOrderClass('77', '118.25', '1', '7th Ave & W 48th St,',
        'Home Delivert', 'Preparing'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: list == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderProgressPage(
                                                  id: '1',
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 8, 10),
                                    decoration: BoxDecoration(
                                      color: LIGHT_GREY,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 15, 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Order No.: ${list[index].order_no}",
                                                    style: TextStyle(
                                                      fontFamily: 'GlobalFonts',
                                                      color: BLACK,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    double.parse(list[index]
                                                            .total_amount)
                                                        .toStringAsFixed(2),
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'GlobalFonts',
                                                        color: BLACK,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 30,
                                                width: 100,
                                                //margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: GREY)),
                                                child: Center(
                                                    child: Text(
                                                  list[index].orderStatus ?? "",
                                                  style: TextStyle(
                                                      fontFamily: 'GlobalFonts',
                                                      color: BLACK,
                                                      fontSize: 12),
                                                )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            list[index].address == null
                                                ? 'Pickup Order'
                                                : list[index].address!,
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
                                );
                              }),
                        ),
                      ],
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
                            color: BLACK,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Order history',
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
}

class BookOrderClass {
  String? order_no;
  String total_amount;
  String? order_id;
  String? address;
  String? deivery_mode;
  String? orderStatus;

  BookOrderClass(this.order_no, this.total_amount, this.order_id, this.address,
      this.deivery_mode, this.orderStatus);
}

class OrderProcessClass {
  String? success;
  List<OrderDetails> orderDetails;

  OrderProcessClass({this.success, required this.orderDetails});
}

class OrderDetails {
  int? itemOrder;
  String? address;
  String? contact;
  String? totalPrice;
  String? orderStatus;
  String? placeStatus;
  String? orderPlacedDate;
  String? preparingStatus;
  String? preparingDateTime;
  String? dispatchedStatus;
  String? dispatchedDateTime;
  String? deliveredDateTime;
  String? deliveredStatus;
  String? cancelDateTime;
  String? deliveryCharges;
  String? tax;
  String? deliveryMode;
  List<Menu>? menu;

  OrderDetails(
      {this.itemOrder,
      this.address,
      this.contact,
      this.totalPrice,
      this.orderStatus,
      this.placeStatus,
      this.orderPlacedDate,
      this.preparingStatus,
      this.preparingDateTime,
      this.dispatchedStatus,
      this.dispatchedDateTime,
      this.deliveredDateTime,
      this.deliveredStatus,
      this.cancelDateTime,
      this.deliveryCharges,
      this.tax,
      this.deliveryMode,
      this.menu});
}

class Menu {
  String? itemId;
  String? itemName;
  String? itemQty;
  String? itemAmt;
  String? itemTotalPrice;
  List<Topping>? topping;

  Menu(
      {this.itemId,
      this.itemName,
      this.itemQty,
      this.itemAmt,
      this.itemTotalPrice,
      this.topping});
}

class Topping {
  String? id;
  String? topCatId;
  String? name;
  String? price;

  Topping({this.id, this.topCatId, this.name, this.price});
}
