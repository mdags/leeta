import 'package:flutter/material.dart';
import 'package:leeta/widgets/variables.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String phoneNumber = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String phnNumberError = "";
  bool isPhoneNumberError = false;
  bool isNameError = false;
  bool isEmailError = false;
  bool isPassError = false;
  String token = "";
  String error = "";

//  @override
//   void initState() {
//     super.initState();
//     getToken();
//   }

//   getToken() async{

//     FirebaseMessaging().getToken().then((value){
//       //Toast.show(value, context, duration: 2);
//       print(value);
//       setState(() {
//         token = value;
//       });
//     });

//   }

  registerUser() async {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: BLACK,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account',
                      style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: WHITE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Login Now",
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: THEME_COLOR,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height - 80,
                  decoration: BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Row(
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
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter Name',
                            labelStyle: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: GREY,
                                fontWeight: FontWeight.bold),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: GREY)),
                            errorText: isNameError ? 'Enter your name' : null,
                          ),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setState(() {
                              name = val;
                              isNameError = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Enter Mobile Number',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              errorText:
                                  isPhoneNumberError ? phnNumberError : null,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY))),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setState(() {
                              phoneNumber = val;
                              isPhoneNumberError = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Enter Email Address',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              errorText:
                                  isEmailError ? 'Enter valid email' : null,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY))),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                              isEmailError = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              errorText:
                                  isPassError ? "Password doesn't match" : null,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY))),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setState(() {
                              password = val;
                              isPassError = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              errorText:
                                  isPassError ? "Password doesn't match" : null,
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY))),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: GREY,
                              fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setState(() {
                              confirmPassword = val;
                              isPassError = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: THEME_COLOR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      45,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                onPressed: () => registerUser(),
                                child: Text('Sign In',
                                    style: TextStyle(
                                      fontFamily: 'GlobalFonts',
                                      color: BLACK,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Creating Account',
                style: TextStyle(
                  fontFamily: 'GlobalFonts',
                  color: BLACK,
                )),
            content: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      'Please wait while creating account...',
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  messageDialog(String s1, String s2) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              s1,
              style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s2,
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
                style: TextButton.styleFrom(
                  primary: THEME_COLOR,
                ),
                child: Text(
                  'OK',
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
