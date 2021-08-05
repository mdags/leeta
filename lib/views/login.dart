import 'package:flutter/material.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/forgot_password.dart';
import 'package:leeta/views/signup.dart';
import 'package:leeta/widgets/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final txtUserName = new TextEditingController();
  final txtPassword = new TextEditingController();
  var _formKey = new GlobalKey<FormState>();
  // String phoneNumber = "";
  // String pass = "";
  // bool isPhoneNumberError = false;
  // bool isPasswordError = false;
  // String passErrorText = "";
  // String token = "";
  bool _isLoading = false;

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
  void getLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      txtUserName.text = prefs.getString('username') ?? "";
      txtPassword.text = prefs.getString('password') ?? "";
    });
  }

  login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response =
          await ApiProvider.login(txtUserName.text, txtPassword.text);
      if (response.contains("err")) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      response.contains("err:") ? Text("Error") : Text("Done"),
                  content: Text(response.replaceAll("err:", "")),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"))
                  ],
                ));
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', txtUserName.text);
        prefs.setString('password', txtPassword.text);
        Navigator.pushNamed(context, "/home");
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLoginInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLACK,
      body: Form(
        key: _formKey,
        child: Stack(
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
                        TextFormField(
                          controller: txtUserName,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Enter Mobile Number',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: GREY,
                              ))),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontWeight: FontWeight.bold),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: txtPassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: GREY,
                                fontWeight: FontWeight.bold),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: GREY,
                            )),
                          ),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: GREY,
                              fontWeight: FontWeight.bold),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
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
                                onPressed: _isLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          login();
                                        }
                                      },
                                child: _isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
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
