import 'package:flutter/material.dart';
import 'package:leeta/views/login.dart';
import 'package:leeta/widgets/variables.dart';

class PleaseLoginBody extends StatelessWidget {
  const PleaseLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/please_login.png",
            width: 200.0,
            height: 200.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: THEME_COLOR,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 60.0)),
          onPressed: () => Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => LoginPage())),
          child: Text(
            'Please Login',
            style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
