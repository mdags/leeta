import 'package:flutter/material.dart';
import 'package:leeta/views/cart.dart';
import 'package:leeta/views/favourites.dart';
import 'package:leeta/views/order_history.dart';
import 'package:leeta/views/home.dart';
import 'package:leeta/views/login.dart';
import 'package:leeta/views/privacy_policy.dart';
import 'package:leeta/widgets/variables.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int totalCartItems = 0;
  // CartITems cartITems = CartITems();
  bool isLoggedIn = true;
  String name = "";
  String email = "";
  String userId = "";
  String bookOrderLength = '0';
  String vehicalNumber = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //read();
    //getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Image.asset(
                            "assets/icons/cancel.png",
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                          ),
                          onTap: () {
                            HomePage().createState().closeDrawer(context);
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        if (!isLoggedIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                          HomePage().createState().closeDrawer(context);
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: LIGHT_GREY),
                            child: Icon(
                              Icons.account_circle,
                              size: 70,
                              color: THEME_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isLoggedIn ? name : 'Sign In',
                                style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                isLoggedIn ? email : 'Profile',
                                style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon:
                                        Icon(Icons.power_settings_new_rounded),
                                    onPressed: () {
                                      showdialog2();
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  Categories",
                          style: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: BLACK,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          HomePage().createState().closeDrawer(context);
                        },
                        leading: Image.asset(
                          "assets/icons/1.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.contain,
                          color: BLACK,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  My Cart",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        leading: Image.asset(
                          "assets/icons/2.png",
                          height: 25,
                          width: 25,
                          color: BLACK,
                          fit: BoxFit.contain,
                        ),
                        trailing: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: THEME_COLOR),
                          child: Center(
                            child: Text(
                              totalCartItems.toString(),
                              style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: BLACK,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                          HomePage().createState().closeDrawer(context);
                          //   read();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  Order History",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        onTap: () {
                          // userId == null
                          //     ? showdialog()
                          //     //? Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAsCustomer()))
                          //:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderHistoryPage()));
                          HomePage().createState().closeDrawer(context);
                        },
                        leading: Image.asset(
                          "assets/icons/3.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.contain,
                          color: BLACK,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  Favourites",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavouritesPage(),
                              ));
                          HomePage().createState().closeDrawer(context);
                        },
                        leading: Image.asset(
                          "assets/icons/4.png",
                          height: 25,
                          width: 25,
                          color: BLACK,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  About Us",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        onTap: () {
                          HomePage().createState().closeDrawer(context);
                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => AboutUs()),
                          // );
                        },
                        leading: Image.asset(
                          "assets/icons/5.png",
                          height: 25,
                          width: 25,
                          color: BLACK,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        title: Text(
                          "  Our Policy",
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyPage()),
                          );
                          HomePage().createState().closeDrawer(context);
                        },
                        leading: Image.asset(
                          "assets/icons/6.png",
                          height: 25,
                          width: 25,
                          color: BLACK,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            userId == null
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => LoginAsDeliveryBoy()),
                          // );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: GREY)),
                              child: Center(
                                child: Image.asset(
                                  "assets/icons/login.png",
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                  color: BLACK,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "LOGIN_AS_DELIVERY_BOY",
                              style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: BLACK,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              'ALERT',
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
                  'SIDEMENU_DIALOG_TEXT',
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
                  'No',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: THEME_COLOR,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAsCustomer()));
                },
                child: Text(
                  'YES',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: BLACK,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: THEME_COLOR,
                ),
              ),
            ],
          );
        });
  }

  showdialog2() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'LOGOUT',
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
                  'ARE_YOU_SURE_TO_LOGOUT',
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
                  'NO',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    fontWeight: FontWeight.w900,
                    color: THEME_COLOR,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // await SharedPreferences.getInstance().then((pref){
                  //   pref.setBool("isLoggedIn", false);
                  //   pref.setString("userId", null);
                  //   pref.setString("name", null);
                  //   pref.setString("phone", null);
                  //   pref.setString("email", null);
                  // });
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // );
                },
                child: Text(
                  'YES',
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: BLACK,
                    fontWeight: FontWeight.w900,
                  ),
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
