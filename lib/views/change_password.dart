import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/widgets/variables.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  var _formKey = GlobalKey<FormState>();
  var txtOldPassword = new TextEditingController();
  var txtNewPassword = new TextEditingController();
  bool _isLoading = false;

  void changePassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response = await ApiProvider.changePassword(
          txtOldPassword.text, txtNewPassword.text);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: response.contains("err:") ? Text("Error") : Text("Done"),
                content: response.contains("err:")
                    ? Text(response.replaceAll("err:", ""))
                    : Text("Your password has been changed successfully."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (!response.contains("err:")) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text("OK"))
                ],
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: txtOldPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Enter Old Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY)),
                            ),
                            style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: BLACK,
                                fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          TextFormField(
                            controller: txtNewPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Enter New Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'GlobalFonts',
                                  color: GREY,
                                  fontWeight: FontWeight.bold),
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: GREY)),
                            ),
                            style: TextStyle(
                                fontFamily: 'GlobalFonts',
                                color: BLACK,
                                fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(13),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    backgroundColor: THEME_COLOR,
                                  ),
                                  onPressed: _isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            changePassword();
                                          }
                                        },
                                  child: _isLoading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'Change Password',
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
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
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
                    'Change Password',
                    style: GoogleFonts.comfortaa(
                        color: Colors.black,
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
