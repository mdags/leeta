import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeta/widgets/variables.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Old Password',
                          style: GoogleFonts.comfortaa(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Enter',
                          style: GoogleFonts.comfortaa(
                              fontSize: 13, color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          thickness: 0.5,
                          height: 20,
                          color: Colors.grey.shade700,
                        ),
                        Text(
                          'New Password',
                          style: GoogleFonts.comfortaa(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Enter',
                          style: GoogleFonts.comfortaa(
                              fontSize: 13, color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          thickness: 0.5,
                          height: 20,
                          color: Colors.grey.shade700,
                        ),
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
