import 'package:flutter/material.dart';
import 'package:leeta/views/forgot_password.dart';
import 'package:leeta/views/signup.dart';
import 'package:leeta/widgets/variables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber = "";
  String pass = "";
  bool isPhoneNumberError = false;
  bool isPasswordError = false;
  String passErrorText = "";
  String token = "";

// getToken() async{
//     FirebaseMessaging().getToken().then((value){
//       //Toast.show(value, context, duration: 2);
//       print(value);
//       setState(() {
//         token = value;
//       });
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getToken();
//   }

//   loginInto() async{
//     if(phoneNumber.length < 10){
//       setState(() {
//         isPhoneNumberError = true;
//       });
//     }else {
//       dialog();
//       //Toast.show("Logging in..", context, duration: 2);
//       String url = "$SERVER_ADDRESS/api/login?mobile_no=$phoneNumber&password=$pass&token=$token";
//       var response = await http.post(url, body: {
//         'mobile_no': phoneNumber,
//         'password': pass,
//         'token': token,
//       });
//       print(response.statusCode);
//       print(response.body);
//       var jsonResponse = await convert.jsonDecode(response.body);
//       if (jsonResponse['data']['success'] == "0") {
//         setState(() {
//           Navigator.pop(context);
//           isPasswordError = true;
//           passErrorText = EITHER_MOBILE_NUMBER_OR_PASSWORD_IS_INCORRECT;
//         });
//       }else{
//         await SharedPreferences.getInstance().then((pref){
//           pref.setBool("isLoggedIn", true);
//           pref.setString("userId", jsonResponse['data']['register']['user_id'].toString());
//           pref.setString("name", jsonResponse['data']['register']['name']);
//           pref.setString("phone", jsonResponse['data']['register']['phone']);
//           pref.setString("email", jsonResponse['data']['register']['email']);
//           pref.setString("token", token.toString());
//         });
//         Navigator.of(context).popUntil((route) => route.isFirst);
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => HomeScreen())
//         );
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Don't have an account",
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        color: WHITE,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      " Register Now",
                      style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: THEME_COLOR,
                          fontWeight: FontWeight.w900,
                          fontSize: 13),
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
                decoration: BoxDecoration(
                    color: WHITE,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: MediaQuery.of(context).size.height - 80,
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
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        "assets/icons/login_icon.png",
                        height: 180,
                        width: 180,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Enter Mobile Number',
                            labelStyle: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: GREY,
                                fontWeight: FontWeight.bold),
                            errorText: isPhoneNumberError
                                ? 'Enter Valid Phone Number'
                                : null,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: GREY,
                            ))),
                        style: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: BLACK,
                            fontWeight: FontWeight.bold),
                        onChanged: (val) {
                          setState(() {
                            phoneNumber = val;
                            isPhoneNumberError = false;
                            isPasswordError = false;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: GREY,
                              fontWeight: FontWeight.bold),
                          errorText: isPasswordError ? passErrorText : null,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: GREY,
                          )),
                        ),
                        style: TextStyle(
                            fontFamily: 'GlobalFonts',
                            color: GREY,
                            fontWeight: FontWeight.bold),
                        onChanged: (val) {
                          setState(() {
                            pass = val;
                            isPasswordError = false;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Text(
                              'Forgot password ?',
                              style: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: BLACK,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(13),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                backgroundColor: THEME_COLOR,
                              ),
                              onPressed: () {
                                // loginInto();
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
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
    );
  }

  dialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Logging In',
              style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
              ),
            ),
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
                      'Please wait while logging into account...',
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
}
