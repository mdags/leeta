import 'package:flutter/material.dart';
import 'package:leeta/widgets/variables.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "\nThese terms and conditions outline the rules and regulations for the use of Medic Finder Website."
                    "\n\nBy accessing this website we assume you accept these terms and conditions in full. Do not continue to use FoodDelivery's website if you do not accept all of the terms and conditions stated on this page."
                    "\n\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and any or all Agreements: Client, You and Your refers to you, the person accessing this website and accepting the Companys terms and conditions. The Company, Ourselves, We, Our and Us, refers to our Company. Party, Parties, or Us, refers to both the Client and ourselves, or either the Client or ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner, whether by formal meetings of a fixed duration, or any other means, for the express purpose of meeting the Clients needs in respect of provision of the Companys stated services/products, in accordance with and subject to, prevailing law of . Any use of the above terminology or other words in the singular, plural, capitalisation and/or he/she or they, are taken as interchangeable and therefore as referring to same."
                    "\n\n",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Reservation of Rights",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "\nWe reserve the right at any time and in its sole discretion to request that you remove all links or any particular link to our Web site. You agree to immediately remove all links to our Web site upon such request. We also reserve the right to amend these terms and conditions and its linking policy at any time. By continuing to link to our Web site, you agree to be bound to and abide by these linking terms and conditions.\n\n",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Disclaimer",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "\nTo the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website (including, without limitation, any warranties implied by law in respect of satisfactory quality, fitness for purpose and/or the use of reasonable care and skill). Nothing in this disclaimer will:\n\n"
                    "\n1.) limit or exclude our or your liability for death or personal injury resulting from negligence"
                    "\n2.) limit or exclude our or your liability for fraud or fraudulent misrepresentation"
                    "\n3.) limit any of our or your liabilities in any way that is not permitted under applicable law"
                    "\n4.) exclude any of our or your liabilities that may not be excluded under applicable law."
                    "\n\nThe limitations and exclusions of liability set out in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer or in relation to the subject matter of this disclaimer, including liabilities arising in contract, in tort (including negligence) and for breach of statutory duty."
                    "\nTo the extent that the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "\n\nCredit & Contact Information",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "\nThis Terms and conditions page was created at termsandconditionstemplate.com generator. If you have any queries regarding any of our terms, please contact us.",
                    style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      color: BLACK,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
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
                  'Privacy Policy',
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
