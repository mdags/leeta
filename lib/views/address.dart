import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:leeta/models/address_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/widgets/variables.dart';

class AddressPage extends StatefulWidget {
  final bool isReturn;
  const AddressPage({Key? key, required this.isReturn}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var list = <AddressModel>[];
  bool _isLoading = false;
  var _formKey = GlobalKey<FormState>();
  var txtAdrName = new TextEditingController();

  void fetchList() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var data = await ApiProvider.fetchAddress();
      if (data != null) {
        list = data;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void addAddress(adrName, fullAddress) async {
    var response = await ApiProvider.addAddress(adrName, fullAddress);
    print(response);
    fetchList();
  }

  void delAddress(id) async {
    var response = await ApiProvider.delAddress(id);
    print(response);
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Address'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  if (result.formattedAddress != null) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text('Add New Address'),
                                              content: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: txtAdrName,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter Address Name',
                                                        labelStyle: TextStyle(
                                                            fontFamily:
                                                                'GlobalFonts',
                                                            color: GREY,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        border:
                                                            UnderlineInputBorder(),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            GREY)),
                                                      ),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'GlobalFonts',
                                                          color: BLACK,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(result
                                                        .formattedAddress!),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        addAddress(
                                                            txtAdrName.text,
                                                            result
                                                                .formattedAddress!);
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: Text(
                                                      'SAVE',
                                                      style: ALERT_BUTTON_TEXT_STYLE
                                                          .copyWith(
                                                              color:
                                                                  THEME_COLOR),
                                                    )),
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text(
                                                      'CANCEL',
                                                      style:
                                                          ALERT_BUTTON_TEXT_STYLE,
                                                    )),
                                              ],
                                            ));
                                  }
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
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (widget.isReturn) {
                                          Navigator.pop(context, list[index]);
                                        }
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index].adrName!,
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
                                              list[index].fullAddress,
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
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Confirm'),
                                                  content: Text(
                                                      'Do you want to delete the this record.'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          delAddress(list[index]
                                                              .id
                                                              .toString());
                                                          fetchList();
                                                        },
                                                        child: Text(
                                                          'YES',
                                                          style: ALERT_BUTTON_TEXT_STYLE
                                                              .copyWith(
                                                                  color:
                                                                      THEME_COLOR),
                                                        )),
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Text(
                                                          'NO',
                                                          style:
                                                              ALERT_BUTTON_TEXT_STYLE,
                                                        )),
                                                  ],
                                                ));
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
      ),
    );
  }
}
