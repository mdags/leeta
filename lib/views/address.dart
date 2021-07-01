import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:leeta/widgets/variables.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var list = <AddedLocations>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(new AddedLocations("Home", "Test", "10", "20"));
    list.add(new AddedLocations("Work", "Test 2", "10", "20"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlacePicker(
                                    apiKey:
                                        'AIzaSyBH-yIUHdTxiaeV0TUWrY7ibIeW9bIPlYI', // Put YOUR OWN KEY here.
                                    onPlacePicked: (result) {
                                      print(result.formattedAddress);
                                      Navigator.of(context).pop();
                                    },
                                    initialPosition:
                                        LatLng(-33.8567844, 151.213108),
                                    useCurrentLocation: true,
                                    selectInitialPosition: true,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  ' Add Address',
                                  style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                    ),
                    ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context, list[index]);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].type,
                                          style: TextStyle(
                                            fontFamily: 'GlobalFonts',
                                            color: BLACK,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            list[index].addressLine,
                                            style: TextStyle(
                                              fontFamily: 'GlobalFonts',
                                              fontWeight: FontWeight.bold,
                                              color: GREY,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    icon: Image.asset(
                                      'assets/icons/delete.png',
                                      height: 21,
                                      width: 21,
                                      color: BLACK,
                                    ),
                                    onPressed: () {
                                      // addedLocations.removeFromFavourites(list[index].lat+list[index].long)
                                      // .then((value){
                                      //   read();
                                      // });
                                    })
                              ],
                            ),
                            Divider(
                              height: 35,
                              thickness: 1,
                            ),
                          ],
                        );
                      },
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
                    'My Address',
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
      ),
    );
  }
}

class AddedLocations {
  String type;
  String addressLine;
  String lat;
  String long;

  AddedLocations(this.type, this.addressLine, this.lat, this.long);
}
