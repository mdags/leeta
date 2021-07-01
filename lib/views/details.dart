import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leeta/widgets/variables.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int id;

  const DetailsPage(
      {Key? key,
      required this.name,
      required this.image,
      required this.description,
      required this.id})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var options = <bool>[];
  var toppingData = <Toppings>[];
  var toppingTitle = <Toppings>[];
  bool isLoadingToppings = false;
  int titleLength = 0;
  var toppingLength = <int>[];
  int quantity = 1;
  double actualPrice = 10;
  bool downloadingError = false;
  String imagePath = "";
  bool isLiked = false;
  var addedToppings = <Toppings>[];
  bool isDeleted = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                SafeArea(
                  child: isDeleted
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "!",
                                style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                    fontSize: 150),
                              ),
                              Text('REQUESTED_ITEM_NOT_AVAILABLE',
                                  style: TextStyle(
                                    fontFamily: 'GlobalFonts',
                                    color: BLACK,
                                  )),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            children: [
                              Container(
                                //height: 275,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                              "assets/icons/back.png",
                                              height: 15,
                                              width: 15,
                                              fit: BoxFit.contain,
                                              color: BLACK,
                                            )),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.image,
                                          height: 200,
                                          placeholder: (context, url) => Icon(
                                            Icons.image,
                                            color: LIGHT_GREY,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                widget.name,
                                                style: TextStyle(
                                                  fontFamily: 'GlobalFonts',
                                                  color: BLACK,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color:
                                                          GREY.withOpacity(0.5),
                                                      width: 1)),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      icon: Image.asset(
                                                        "assets/icons/Minus.png",
                                                        height: 12,
                                                        width: 12,
                                                        fit: BoxFit.contain,
                                                        color: BLACK,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (quantity > 1) {
                                                            quantity -= 1;
                                                            // widget.price =  (double.parse(widget.price) - double.parse(widget.price)/(quantity+1)).toString();
                                                          }
                                                        });
                                                      }),
                                                  Text(
                                                    quantity.toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'GlobalFonts',
                                                      color: BLACK,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      icon: Image.asset(
                                                        "assets/icons/Plus.png",
                                                        height: 12,
                                                        width: 12,
                                                        fit: BoxFit.contain,
                                                        color: BLACK,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          quantity += 1;
                                                          // widget.price =  (double.parse(widget.price) + double.parse(widget.price)/(quantity-1)).toString();
                                                        });
                                                      }),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "${double.parse('20').toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontFamily: 'GlobalFonts',
                                                color: BLACK,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          widget.description,
                                          style: TextStyle(
                                              fontFamily: 'GlobalFonts',
                                              color: GREY,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Visibility(
                                          visible: isLoadingToppings,
                                          child: Row(
                                            children: [
                                              Text(
                                                'EXTRA_CHOOSE_A_TOPPING',
                                                style: TextStyle(
                                                  fontFamily: 'GlobalFonts',
                                                  color: BLACK,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        !isLoadingToppings
                                            ? SingleChildScrollView(
                                                child: Column(
                                                  children: List.generate(
                                                      titleLength, (i) {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'toppingTitle[i].title',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'GlobalFonts',
                                                                color: BLACK,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: GridView.count(
                                                            shrinkWrap: true,
                                                            physics:
                                                                ClampingScrollPhysics(),
                                                            crossAxisCount: 2,
                                                            childAspectRatio: 3,
                                                            crossAxisSpacing: 5,
                                                            mainAxisSpacing: 10,
                                                            children:
                                                                List.generate(
                                                                    toppingLength[
                                                                        i],
                                                                    (index) {
                                                              //print(toppingData[index+(i==0?0:toppingLength[i-1])].toppingName);
                                                              int toppingIndex =
                                                                  0;
                                                              for (int x = 0;
                                                                  x < i;
                                                                  x++) {
                                                                toppingIndex =
                                                                    toppingIndex +
                                                                        toppingLength[
                                                                            x];
                                                              }
                                                              return optionsMenu(
                                                                  'toppingData[index+toppingIndex].toppingName',
                                                                  index +
                                                                      toppingIndex);
                                                            }),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ),
                                              )
                                            : Container(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                          THEME_COLOR),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                isDeleted
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          color: WHITE,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // await favourites.removeFromFavourites(widget.id);
                                      Navigator.pop(context, true);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: THEME_COLOR,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'REMOVE_FROM_FAVOURITES',
                                          style: TextStyle(
                                            fontFamily: 'GlobalFonts',
                                            color: BLACK,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          color: WHITE,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      // isLiked
                                      //     ? favourites.removeFromFavourites(widget.id).then((value){
                                      //   setState(() {
                                      //     isLiked = value;
                                      //   });
                                      // })
                                      //     : favourites.addToDataBase(Favourites.constuctor(widget.id, widget.name, widget.price,widget.image,widget.description),)
                                      //     .then((value){
                                      //   Toast.show(ADDED_TO_FAVOURITES, context,duration: 1);
                                      //   setState(() {
                                      //     isLiked = value;
                                      //   });
                                      // });
                                    },
                                    child: isLiked
                                        ? Image.asset("assets/icons/Like.png",
                                            color: DEEP_ORANGE_COLOR)
                                        : Image.asset("assets/icons/Like.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      String toppingString = "";
                                      // for(int i=0; i<addedToppings.length; i++) {
                                      //   toppingString = toppingString + addedToppings[i].toppingName + "*";
                                      // }
                                      print(toppingString);
                                      showdialog(false);
                                      // cartITems.addToCart(
                                      //     CartITems.constructor(
                                      //       quantity.toString(),
                                      //       widget.name,
                                      //       widget.price,
                                      //       widget.image.replaceAll("\\", ""),
                                      //       addedToppings,
                                      //       actualPrice.toString(),
                                      //       widget.id.toString(),
                                      //     )
                                      // ).then((value){

                                      //   Navigator.pop(context);
                                      //   showdialog(true);
                                      //   //Toast.show('Added to cart', context, duration: 2);
                                      // });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: THEME_COLOR,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ADD_TO_CART',
                                          style: TextStyle(
                                            fontFamily: 'GlobalFonts',
                                            color: BLACK,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
    );
  }

  optionsMenu(String option, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          options[index] = !options[index];
          if (options[index]) {
            addedToppings.add(Toppings(
              toppingData[index].id,
              toppingData[index].top_cat_id,
              toppingData[index].toppingName,
              toppingData[index].toppingPrice,
            ));
            print('added\n $addedToppings');
            for (int i = 0; i < addedToppings.length; i++) {
              print(addedToppings[i].toppingName);
            }
          } else {
            print(addedToppings.length);
            print("index : $index");
            for (int i = 0; i < addedToppings.length; i++) {
              if (addedToppings[i].id == toppingData[index].id) {
                addedToppings.removeAt(i);
                print('removed');
              }
            }
          }
          // options[index]
          // ? widget.price =  (double.parse(widget.price) + (quantity*2)).toString()
          // : widget.price =  (double.parse(widget.price) - (quantity*2)).toString();
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 30,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: GREY.withOpacity(0.5), width: 1),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              Image.asset(
                !options[index]
                    ? "assets/icons/radio.png"
                    : "assets/icons/radio_active.png",
                height: 15,
                width: 15,
                fit: BoxFit.contain,
                color: DEEP_ORANGE_COLOR,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                option,
                style: TextStyle(
                    fontFamily: 'GlobalFonts', color: BLACK, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showdialog(bool isAdded) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isAdded ? 'ADDED' : 'PROCESSING',
              style: TextStyle(
                fontFamily: 'GlobalFonts',
                color: BLACK,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: isAdded
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'quantity {widget.name}, SUCCESSFULLY_ADDED_TO_CART_FOR_PRICE {widget.price} CLICK_CHECKOUT_TO_GO_TO_CART',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontSize: 15,
                        ),
                      )
                    ],
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            actions: isAdded
                ? [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ADD_MORE',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: THEME_COLOR,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                      },
                      child: Text(
                        'CHECKOUT',
                        style: TextStyle(
                          fontFamily: 'GlobalFonts',
                          color: BLACK,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: THEME_COLOR,
                      ),
                    ),
                  ]
                : null,
          );
        });
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

class Toppings {
  String? title;
  String? id;
  String? top_cat_id;
  String? toppingName;
  String? toppingPrice;

  Toppings(this.id, this.top_cat_id, this.toppingName, this.toppingPrice);

  Toppings.title(this.title);

  Map<String, dynamic> toJson() => {
        'id': id,
        'top_cat_id': top_cat_id,
        'name': toppingName,
        'price': toppingPrice,
      };
}
