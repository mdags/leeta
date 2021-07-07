import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/address.dart';
import 'package:leeta/views/change_password.dart';
import 'package:leeta/views/my_profile.dart';
import 'package:leeta/widgets/variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile? file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      var response = await ApiProvider.uploadProfilePhoto(file.path.toString());
      setState(() {
        USER_PHOTO = "http://leeta.akillisirketler.com/uploads/" + file.name;
      });
    } else {
      print('User canceled the picker');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 200,
              foregroundDecoration: BoxDecoration(color: THEME_COLOR),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: THEME_COLOR,
                      child: ClipOval(
                        child: USER_PHOTO.isNotEmpty
                            ? Image.network(
                                USER_PHOTO,
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 150,
                                color: BLACK,
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            color: Colors.white,
                            onPressed: () => pickFile(),
                          ),
                          decoration: BoxDecoration(
                              color: DEEP_ORANGE_COLOR,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )),
                  ],
                ),
                // CircleAvatar(
                //   radius: 40 + 4.0,
                //   backgroundColor: THEME_COLOR,
                //   child: CircleAvatar(
                //     radius: 40,
                //     backgroundColor: THEME_COLOR,
                //     child: CircleAvatar(
                //       radius: 40 - 4.0,
                //       backgroundImage: AssetImage('assets/icons/person.png'),
                //     ),
                //   ),
                // ),
                Card(
                  color: Colors.white,
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              USER_NAME,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              USER_GSM,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    cardItemWidget(Icons.info, "My Profile\n", () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => MyProfilePage()));
                    }),
                    cardItemWidget(Icons.location_pin, "My Address\n", () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => AddressPage(
                                isReturn: false,
                              )));
                    }),
                    cardItemWidget(Icons.password, "Change\nPassword", () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => ChangePasswordPage()));
                    }),
                    cardItemWidget(Icons.settings, "Settings\n", () {
                      // Navigator.of(context).push(new MaterialPageRoute(
                      //     builder: (context) => SettingsPage()));
                    }),
                    cardItemWidget(
                        Icons.support_agent_outlined, "Support\n", () {}),
                    cardItemWidget(Icons.logout, "Log\nOut", () {
                      setState(() {
                        USER_ID = 0;
                        IS_LOGGED_IN = false;
                      });
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardItemWidget(IconData icon, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 48,
              color: THEME_COLOR,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
