import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeta/models/member_model.dart';
import 'package:leeta/models/user_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/widgets/variables.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  var _formKey = GlobalKey<FormState>();
  var txtName = new TextEditingController();
  var txtGsm = new TextEditingController();
  var txtEmail = new TextEditingController();
  bool isLoading = false;

  void getProfile() async {
    var data = await ApiProvider.getProfile();
    if (data != null) {
      txtName.text = data.userName;
      txtGsm.text = data.userPhone!;
      txtEmail.text = data.userEmail!;
    }
  }

  void updateProfile() async {
    setState(() {
      isLoading = true;
    });
    try {
      MemberModel model = new MemberModel(
          id: USER_ID, userName: txtName.text, userPhone: txtGsm.text);
      var response = await ApiProvider.updateProfile(model);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: response.contains("err:") ? Text("Error") : Text("Done"),
                content: response.contains("err:")
                    ? Text(response.replaceAll("err:", ""))
                    : Text("Your profile has been updated successfully."),
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
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: GoogleFonts.comfortaa(fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: txtName,
                  decoration: InputDecoration(
                    labelText: 'Name Surname',
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
                  controller: txtGsm,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: GREY,
                          fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: GREY))),
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
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: GREY,
                          fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: GREY))),
                  style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
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
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  updateProfile();
                                }
                              },
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text('Save',
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
    );
  }
}
