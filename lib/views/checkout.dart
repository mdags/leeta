import 'package:flutter/material.dart';
import 'package:leeta/views/cart.dart';
import 'package:leeta/widgets/variables.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isHomeDeliverySelected = false;
  bool isPickUpSelected = false;
  String name = "";
  String email = "";
  String phone = "";
  String address = "";
  String note = "";
  String userId = "";
  String langLat = "";
  bool isNameError = false;
  bool isEmailError = false;
  bool isPhoneError = false;
  String food_desc = "";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  // FoodDescription foodDescription = FoodDescription.defaultc();
  var cartITems = <CartITems>[];
  // AddedLocations addedLocations = AddedLocations();
  var cities = <String>[];
  String selectedCity = "";
  String order_id = "";
  String token = "";
  // Source _source;
  String stripeToken = "";
  String paymentId = "";
  bool isCashSelected = false;
  bool isStripeSelected = false;
  bool isPaypalSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
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
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: BLACK,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '263.00',
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: GREY,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: BLACK,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  isHomeDeliverySelected ? '10.00' : '0',
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: GREY,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: BLACK,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  isHomeDeliverySelected ? '273.00' : '263.00',
                                  style: TextStyle(
                                      fontFamily: 'GlobalFonts',
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
                    TextField(
                      controller: controllerName,
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        labelStyle: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: GREY,
                            fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: GREY)),
                        //errorText: isNameError ? "Enter your name" : null,
                      ),
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontWeight: FontWeight.bold),
                      onChanged: (val) {
                        // setState(() {
                        //   name = val;
                        //   isNameError = false;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        labelText: 'Enter Email Address',
                        labelStyle: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: GREY,
                            fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: GREY)),
                        //errorText: isNameError ? "Enter your name" : null,
                      ),
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontWeight: FontWeight.bold),
                      onChanged: (val) {
                        // setState(() {
                        //   name = val;
                        //   isNameError = false;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: controllerPhone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Enter Phone Number',
                        labelStyle: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: GREY,
                            fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: GREY)),
                        //errorText: isNameError ? "Enter your name" : null,
                      ),
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: GREY,
                          fontWeight: FontWeight.bold),
                      onChanged: (val) {
                        // setState(() {
                        //   name = val;
                        //   isNameError = false;
                        // });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Address Selection',
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
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
                                      // addedLocations = await Navigator.push(context,
                                      // MaterialPageRoute(builder: (context) => AllLocations()));
                                      // print(addedLocations.addressLine);
                                      // setState(() {
                                      //   address = addedLocations.addressLine;
                                      //   langLat = "${addedLocations.lat},${addedLocations.long}";
                                      // });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 17,
                                      color: BLACK,
                                    ),
                                    label: Text(
                                      'Select Address',
                                      style: TextStyle(
                                        fontFamily: 'GlobalFonts',
                                        color: BLACK,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                // addedLocations = await Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => AllLocations()));
                                // print(addedLocations.addressLine);
                                // setState(() {
                                //   address = addedLocations.addressLine;
                                //   langLat = "${addedLocations.lat},${addedLocations.long}";
                                // });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address == "" ? 'Enter Address' : address,
                                    style: TextStyle(
                                        fontFamily: 'GlobalFonts',
                                        color: GREY,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    height: 25,
                                    thickness: 1,
                                    color: GREY,
                                  ),
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
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your note',
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: GREY)),
                        //errorText: isNameError ? "Enter your name" : null,
                      ),
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                      onChanged: (val) {
                        setState(() {
                          note = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Payment Type',
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
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
                                isPaypalSelected = false;
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
                                      color: !isCashSelected
                                          ? BLACK
                                          : DEEP_ORANGE_COLOR,
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
                                isPaypalSelected = false;
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
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: (){
                        //       setState(() {
                        //         isPaypalSelected = true;
                        //         isCashSelected = false;
                        //         isStripeSelected =  false;
                        //       });
                        //     },
                        //     child: Container(
                        //       height: 50,
                        //       margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(25),
                        //         border: Border.all(color: GREY.withOpacity(0.5), width: 1),
                        //       ),
                        //       child: Center(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           children: [
                        //             SizedBox(width: 15,),
                        //             Image.asset(
                        //               !isPaypalSelected
                        //                   ? "assets/icons/radio.png"
                        //                   : "assets/icons/radio_active.png" ,height: 15, width: 15, fit: BoxFit.contain,),
                        //             SizedBox(width: 5,),
                        //             Text(
                        //               PAYPAL,
                        //               style:  TextStyle(
                        //                   fontFamily: 'GlobalFonts',
                        //                   color: BLACK,
                        //                   fontSize: 12
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            elevation: 0,
                            padding: EdgeInsets.all(12),
                            onPressed: () async {
                              if (isCashSelected) {
                                // proceed("");
                              } else if (isStripeSelected) {
                                String x = "";
                                // x = await Navigator.push(context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MyCardDetails())
                                // );
                                setState(() {
                                  stripeToken = x;
                                });
                                if (stripeToken != null) {
                                  // Toast.show(PROCESSING, context);
                                  // proceed(stripeToken);
                                }
                              }
                              // else if(isPaypalSelected){
                              //   await doPayment(
                              //       clientId: PAYPAL_CLIENT_ID,
                              //       amount: widget.price.toString(),
                              //       callDoPayment: true,
                              //       currency: PAYPAL_PAYMENT_CURRENCY,
                              //   );
                              // }
                              else {
                                // Toast.show(PLEASE_SELECT_PAYMENT_METHOD, context, duration: 2);
                              }
                              //proceed();
                              //Toast.show("${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}", context);
                            },
                            child: Text('Place Order Now',
                                style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            color: THEME_COLOR,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                45,
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
                    'Checkout',
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

  showdialog(bool isProcessing) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isProcessing ? 'PROCESSING' : 'Done',
              style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
                fontWeight: FontWeight.bold,
              ),
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
                        'YOUR_ORDER_HAS_BEEN_PLACED_SUCCESSFULLY_WOULD_YOU_LIKE_CHECK_ORDER_PROGRESS',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
            actions: isProcessing
                ? null
                : [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      //color: Colors.deepOrange.shade100,
                      child: Text(
                        'NO',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: THEME_COLOR,
                          //fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderProgress(order_id)));
                      },
                      color: THEME_COLOR,
                      child: Text(
                        'YES',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
          );
        });
  }
}
