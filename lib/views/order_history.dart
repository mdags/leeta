import 'package:flutter/material.dart';
import 'package:leeta/models/order_modal.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/order_progress.dart';
import 'package:leeta/widgets/variables.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  var list = <OrderModel>[];
  bool isLoading = true;
  String currencySymbol = "";

  void fetchList() async {
    setState(() {
      isLoading = true;
    });
    try {
      var data = await ApiProvider.fetchOrders();
      if (data != null) {
        list = data;
        if (list[0].orderDetails!.length > 0) {
          setState(() {
            currencySymbol = list[0].orderDetails![0].currencySymbol!;
          });
        }
      }
    } finally {
      setState(() {
        isLoading = false;
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
        title: Text('Order history'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderProgressPage(
                                              order: list[index],
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 8, 10),
                                decoration: BoxDecoration(
                                  color: LIGHT_GREY,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                "Order No.: " +
                                                    list[index].id.toString(),
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
                                                currencySymbol +
                                                    list[index]
                                                        .totalAmount!
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontFamily: 'GlobalFonts',
                                                    color: BLACK,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                        list[index].contactAddress == null
                                            ? 'Pickup Order'
                                            : list[index].contactAddress!,
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
      ),
    );
  }
}
