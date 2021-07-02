import 'package:flutter/material.dart';
import 'package:leeta/models/cart_model.dart';
import 'package:leeta/views/address.dart';
import 'package:leeta/views/home.dart';
import 'package:leeta/views/order_progress.dart';
import 'package:leeta/widgets/variables.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> list;
  const CheckoutPage({Key? key, required this.list}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String currencySymbol = "\$";
  double subTotal = 0.0;
  double deliveryCost = 10.0;
  bool isHomeDeliverySelected = true;
  bool isPickUpSelected = false;
  String address = "";
  TextEditingController txtNote = TextEditingController();
  bool isCashSelected = true;
  bool isStripeSelected = false;
  bool error = false;

  void load() {
    widget.list.forEach((element) {
      setState(() {
        subTotal = subTotal + element.totalAmount!;
      });
    });
    if (widget.list.length > 0) {
      setState(() {
        currencySymbol = widget.list[0].currencySymbol!;
      });
    }
  }

  proceed() async {
    if (isHomeDeliverySelected) {
      if (address.isEmpty) {
        setState(() {
          error = true;
        });
        return;
      } else {
        setState(() {
          error = false;
        });
      }
    } else {
      setState(() {
        error = false;
      });
    }
    if (!error) {
      showdialog(true);
    }
    // String url = "$SERVER_ADDRESS/api/food_order";

    // final response = isHomeDeliverySelected
    //     ? await http.post(
    //       url,
    //       body: {
    //       "user_id" : userId,
    //       "name" : name,
    //       "email" : email,
    //       "payment_type" : isCashSelected ? "Cash" : isStripeSelected ? "Stripe" : "Paypal",
    //         "pay_pal_paymentId" : isPaypalSelected ? tokenId : "",
    //         "notes" : note,
    //       "stripeToken" : isStripeSelected ? tokenId : "",
    //       "food_desc" : food_desc,
    //       "total_price" : (widget.price + 10.0).toString(),
    //       "latlong" : langLat.toString(),
    //       "token" : token,
    //       "delivery_charges" : "10",
    //       "delivery_mode" : "0",
    //       "phone_no" : phone,
    //       "address" : address.toString(),
    //       "city" : selectedCity,
    //       "subtotal" : widget.price.toString()
    //     })
    //     : await http.post(
    //       url,
    //       body: {
    //       "user_id" : userId,
    //       "name" : name,
    //       "email" : email,
    //         "stripeToken" : stripeToken,
    //         "payment_type" : isCashSelected ? "Cash" : isStripeSelected ? "Stripe" : "Paypal",
    //         "pay_pal_paymentId" : isPaypalSelected ? tokenId : "",
    //       "notes" : note,
    //       "food_desc": food_desc,
    //         "total_price" : widget.price.toString(),
    //         "latlong" : "null",
    //       "token" : token,
    //       "delivery_charges" : "0",
    //       "delivery_mode" : "1",
    //       "phone_no" : phone,
    //       "pickup_order_time" : "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}",
    //       "city" : selectedCity,
    //       "subtotal" : widget.price.toString()
    //     });

    // print(response.statusCode);
    // print(response.body);
    // if(response.statusCode == 200){
    //   final jsonResponse = convert.jsonDecode(response.body);
    //   if(jsonResponse['success'] == "0"){
    //     Toast.show(jsonResponse["msg"], context,duration: 2);
    //     Navigator.pop(context);
    //   }else{
    //     //Toast.show("Order Placed Successfully", context,duration: 2);
    //     setState(() {
    //       order_id = jsonResponse['order_id'].toString();
    //     });
    //     await cartITems.deleteDatabase();
    //     Navigator.pop(context);
    //     showdialog(false);
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: GREY.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Sub Total',
                            style: STD_TEXT_STYLE.copyWith(fontSize: 14),
                          ),
                          Text(
                            currencySymbol + subTotal.toStringAsFixed(2),
                            style: STD_TEXT_STYLE.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Delivery Charges',
                            style: STD_TEXT_STYLE.copyWith(fontSize: 14),
                          ),
                          Text(
                            isHomeDeliverySelected
                                ? currencySymbol +
                                    deliveryCost.toStringAsFixed(2)
                                : currencySymbol + '0',
                            style: STD_TEXT_STYLE.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total Amount',
                            style: STD_TEXT_STYLE.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            isHomeDeliverySelected
                                ? currencySymbol +
                                    (subTotal + deliveryCost).toStringAsFixed(2)
                                : currencySymbol + subTotal.toStringAsFixed(2),
                            style: STD_TEXT_STYLE.copyWith(
                                color: GREY,
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    USER_NAME,
                    style: INPUT_TEXT_STYLE,
                  ),
                  Divider(
                    height: 25,
                    thickness: 1,
                    color: GREY,
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    USER_GSM,
                    style: INPUT_TEXT_STYLE,
                  ),
                  Divider(
                    height: 25,
                    thickness: 1,
                    color: GREY,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address Selection',
                style: INPUT_TEXT_STYLE.copyWith(fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isHomeDeliverySelected = true;
                          isPickUpSelected = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: GREY.withOpacity(0.5), width: 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                !isHomeDeliverySelected
                                    ? "assets/icons/radio.png"
                                    : "assets/icons/radio_active.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.contain,
                                color: !isHomeDeliverySelected
                                    ? BLACK
                                    : DEEP_ORANGE_COLOR,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Home Delivery',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isHomeDeliverySelected = false;
                          isPickUpSelected = true;
                          error = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: GREY.withOpacity(0.5), width: 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                !isPickUpSelected
                                    ? "assets/icons/radio.png"
                                    : "assets/icons/radio_active.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.contain,
                                color: !isPickUpSelected
                                    ? BLACK
                                    : DEEP_ORANGE_COLOR,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Pickup',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Visibility(
                visible: isHomeDeliverySelected,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                              onPressed: () async {
                                AddedLocations selectedAddress =
                                    await Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                AddressPage()));
                                setState(() {
                                  address = selectedAddress.addressLine;
                                  error = false;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 17,
                                color: BLACK,
                              ),
                              label: Text(
                                'Select Address',
                                style: STD_TEXT_STYLE.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                ),
                              ))
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          AddedLocations? selectedAddress =
                              await Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (context) => AddressPage()));
                          if (selectedAddress != null) {
                            setState(() {
                              address = selectedAddress.addressLine;
                              error = false;
                            });
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.isEmpty ? 'Enter Address' : address,
                              style: address.isEmpty
                                  ? LABEL_TEXT_STYLE
                                  : INPUT_TEXT_STYLE,
                            ),
                            Divider(
                              height: 25,
                              thickness: 1,
                              color: GREY,
                            ),
                            error
                                ? Text(
                                    '* Please select your address.',
                                    style: ERROR_TEXT_STYLE,
                                  )
                                : Center(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Notes',
                style: STD_TEXT_STYLE.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w900),
              ),
              TextField(
                controller: txtNote,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter Your Note',
                  labelStyle: LABEL_TEXT_STYLE,
                  border: UnderlineInputBorder(),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide(color: GREY)),
                ),
                style: INPUT_TEXT_STYLE,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Payment Type',
                style: STD_TEXT_STYLE.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCashSelected = true;
                          isStripeSelected = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: GREY.withOpacity(0.5), width: 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                !isCashSelected
                                    ? "assets/icons/radio.png"
                                    : "assets/icons/radio_active.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.contain,
                                color:
                                    !isCashSelected ? BLACK : DEEP_ORANGE_COLOR,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCashSelected = false;
                          isStripeSelected = true;
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: GREY.withOpacity(0.5), width: 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                !isStripeSelected
                                    ? "assets/icons/radio.png"
                                    : "assets/icons/radio_active.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.contain,
                                color: !isStripeSelected
                                    ? BLACK
                                    : DEEP_ORANGE_COLOR,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Stripe',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => proceed(),
                      child: Text('Place Order Now',
                          style: STD_TEXT_STYLE.copyWith(
                            fontSize: 20,
                          )),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.all(12),
                        primary: THEME_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            45,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showdialog(bool isProcessing) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isProcessing ? 'Processing' : 'Done',
              style: STD_TEXT_STYLE,
            ),
            content: isProcessing
                ? Container(
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Your order has been placed successfully. Would you like to check Order progress?',
                        style: STD_TEXT_STYLE.copyWith(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
            actions: isProcessing
                ? null
                : [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(
                        'NO',
                        style: ALERT_BUTTON_TEXT_STYLE,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderProgressPage(
                                      id: "0",
                                    )));
                      },
                      child: Text(
                        'YES',
                        style: ALERT_BUTTON_TEXT_STYLE,
                      ),
                      style: TextButton.styleFrom(
                        primary: THEME_COLOR,
                      ),
                    ),
                  ],
          );
        });
  }
}
