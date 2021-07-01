import 'package:flutter/material.dart';
import 'package:leeta/widgets/variables.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                    "\n\nMehmet DAGDEVIREN",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      fontSize: 13,
                      color: BLACK,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "\n\nCel. 1234567890",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "\nmehmet.dagdeviren@gmail.com",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "\nwww.mehmetdagdeviren.com",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
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
                    color: BLACK,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'About Us',
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
    ));
  }
}
