import 'package:flutter/material.dart';
import 'package:leeta/models/address_model.dart';
import 'package:leeta/models/cart_model.dart';
import 'package:leeta/models/order_modal.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/address.dart';
import 'package:leeta/views/home.dart';
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
  double shippingAmount = 10.0;
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
      OrderModel model = new OrderModel(
          id: 0,
          userId: USER_ID,
          subTotalAmount: subTotal,
          discountAmount: 0,
          taxAmount: 0,
          taxPercent: 0,
          shippingAmount: shippingAmount,
          totalAmount: subTotal + shippingAmount,
          totalItemCount: 0,
          contactName: USER_NAME,
          contactPhone: USER_GSM,
          contactEmail: "",
          userAddressId: 0,
          contactAddress: address,
          deliveryType: isHomeDeliverySelected ? "Home Delivery" : "Pickup",
          paymentMethod: isCashSelected ? "Cash" : "Stripe",
          paymentStatus: 0,
          orderNote: txtNote.text,
          createdDate: DateTime.now(),
          createdUserId: USER_ID,
          updatedDate: DateTime.now(),
          updatedUserId: USER_ID,
          orderDetails: <OrderDetailModel>[]);
      var response = await ApiProvider.completeOrder(model);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          response.contains("err:")
              ? response.replaceAll("err:", "")
              : 'Order placed successfully',
          style: SNACKBAR_TEXT_STYLE,
        ),
        duration: Duration(seconds: 2),
      ));
      Navigator.pop(context);
      if (response.contains("err:")) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Error',
                    style: STD_TEXT_STYLE,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        response.replaceAll("err:", ""),
                        style: STD_TEXT_STYLE.copyWith(
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
                        style: ALERT_BUTTON_TEXT_STYLE,
                      ),
                    ),
                  ],
                ));
      } else {
        showdialog(false);
      }
    }
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
                                    shippingAmount.toStringAsFixed(2)
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
                                    (subTotal + shippingAmount)
                                        .toStringAsFixed(2)
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
                                AddressModel selectedAddress =
                                    await Navigator.of(context)
                                        .push(new MaterialPageRoute(
                                            builder: (context) => AddressPage(
                                                  isReturn: true,
                                                )));
                                setState(() {
                                  address = selectedAddress.fullAddress;
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
                          AddressModel? selectedAddress =
                              await Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                      builder: (context) => AddressPage(
                                            isReturn: true,
                                          )));
                          if (selectedAddress != null) {
                            setState(() {
                              address = selectedAddress.fullAddress;
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
                        'Your order has been placed successfully.',
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
                        'OK',
                        style: ALERT_BUTTON_TEXT_STYLE,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //     Navigator.pop(context);
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => OrderProgressPage(
                    //                   order: null,
                    //                 )));
                    //   },
                    //   child: Text(
                    //     'YES',
                    //     style: ALERT_BUTTON_TEXT_STYLE,
                    //   ),
                    //   style: TextButton.styleFrom(
                    //     primary: THEME_COLOR,
                    //   ),
                    // ),
                  ],
          );
        });
  }
}
