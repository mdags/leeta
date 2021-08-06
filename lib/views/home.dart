import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeta/models/category_model.dart';
import 'package:leeta/models/product_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/cart.dart';
import 'package:leeta/views/details.dart';
import 'package:leeta/views/favourites.dart';
import 'package:leeta/views/login.dart';
import 'package:leeta/views/notifications.dart';
import 'package:leeta/views/order_history.dart';
import 'package:leeta/views/products.dart';
import 'package:leeta/views/profile.dart';
import 'package:leeta/views/search.dart';
import 'package:leeta/widgets/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedItemIndex = 0;
  var isSelected = <bool>[];
  bool isCategoryLoading = false;
  bool isProductLoading = false;
  var categories = <CategoryModel>[];
  var products = <ProductModel>[];
  int totalCartItems = 0;
  String cartImage1 = "";
  String cartImage2 = "";
  String cartImage3 = "";

  void fetchList() async {
    setState(() {
      isCategoryLoading = true;
      isProductLoading = true;
    });

    try {
      var data = await ApiProvider.fetchCategories();
      if (data != null) {
        categories = data;

        for (int i = 0; i < categories.length; i++) {
          isSelected.add(false);
        }
        setState(() {
          isSelected[0] = !isSelected[0];
        });

        fetchProducts(categories[0].id.toString());

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String username = prefs.getString('username') ?? "";
        String password = prefs.getString('password') ?? "";
        if (username.isNotEmpty) {
          await ApiProvider.login(username, password);
        }
      }
    } finally {
      setState(() {
        isCategoryLoading = false;
      });
    }
  }

  void fetchProducts(String catId) async {
    if (!isProductLoading) {
      setState(() {
        isProductLoading = true;
      });
    }
    try {
      var pData = await ApiProvider.fetchProducts(catId);
      if (pData != null) {
        setState(() {
          products = pData;
        });
      }
    } finally {
      setState(() {
        isProductLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  closeDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: SideMenu(),
      body: bodyWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => SearchPage(), fullscreenDialog: true)),
          child: Icon(
            Icons.search,
            size: 32,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: LIGHT_GREY, primaryColor: THEME_COLOR),
            child: BottomNavigationBar(
              selectedItemColor: BLACK,
              unselectedItemColor: BLACK,
              selectedLabelStyle: TextStyle(fontSize: 12),
              unselectedLabelStyle: TextStyle(fontSize: 12),
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => NotificationsPage()));
                    break;
                  case 1:
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => CartPage()));
                    break;
                  case 2:
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => OrderHistoryPage()));
                    break;
                  case 3:
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => FavouritesPage()));
                    break;
                  default:
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_outlined,
                      size: 30,
                    ),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                    label: 'My Cart'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.manage_search_outlined,
                      size: 30,
                    ),
                    label: 'Order History'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      size: 30,
                    ),
                    label: 'Favourites'),
              ],
            )),
      ),
    );
  }

  Widget bodyWidget() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   child: Image.asset(
                  //     "assets/images/menu.png",
                  //     width: 25,
                  //     height: 15,
                  //     color: BLACK,
                  //     fit: BoxFit.contain,
                  //   ),
                  //   onTap: () {
                  //     _scaffoldKey.currentState!.openDrawer();
                  //   },
                  // ),
                  Text(
                    'Leeta',
                    style: TextStyle(
                        fontFamily: 'GlobalFonts',
                        fontSize: 35,
                        fontWeight: FontWeight.w900),
                  ),
                  InkWell(
                    onTap: () => IS_LOGGED_IN
                        ? Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => ProfilePage()))
                        : Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => LoginPage())),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: THEME_COLOR,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BLACK,
                        ),
                        child: Icon(
                          Icons.account_circle,
                          size: 25,
                          color: THEME_COLOR,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Categories",
                  style: GoogleFonts.comfortaa(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Text(
                //   'Leeta',
                //   style: TextStyle(
                //       fontFamily: 'GlobalFonts',
                //       fontSize: 35,
                //       fontWeight: FontWeight.w900),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                isCategoryLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.count(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        physics: ClampingScrollPhysics(),
                        children: List.generate(categories.length, (index) {
                          return cardItemWidget(categories[index]);
                        }),
                      ),
                // Container(
                //     height: 110,
                //     child: ListView.builder(
                //       itemCount: categories.length,
                //       shrinkWrap: true,
                //       physics: ClampingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return category(
                //             categories[index].imgPath!,
                //             categories[index].name,
                //             index,
                //             categories[index].id);
                //       },
                //     ),
                //   ),
                // SizedBox(
                //   height: 15,
                // ),
                // products.length > 0
                //     ? Text(
                //         'Popular',
                //         style: TextStyle(
                //             fontFamily: 'GlobalFonts',
                //             fontSize: 15,
                //             color: BLACK,
                //             fontWeight: FontWeight.w600),
                //       )
                //     : Center(),
                // SizedBox(
                //   height: 5,
                // ),
                // GridView.count(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 2,
                //   mainAxisSpacing: 5,
                //   shrinkWrap: true,
                //   childAspectRatio: 0.8,
                //   physics: ClampingScrollPhysics(),
                //   children: List.generate(products.length, (index) {
                //     return productCard(products[index]);
                //   }),
                // ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget cardItemWidget(CategoryModel category) {
    return InkWell(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => ProductsPage(
                category: category,
              ))),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(category.imgPath!)),
            ),
            Text(
              category.name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget category(String imagePath, String name, int index, int id) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected[selectedItemIndex] = false;
          selectedItemIndex = index;
          isSelected[index] = !isSelected[index];
          fetchProducts(id.toString());
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                isSelected[index]
                    ? "assets/images/active.png"
                    : "assets/images/un_active.png",
                height: 120,
                width: 70,
                //color: isSelected[index] ? THEME_COLOR : Colors.transparent,
              ),
            ),
            Container(
              height: 120,
              width: 70,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      imagePath,
                      height: 25,
                      width: 25,
                      // placeholder: (context, url) => Icon(
                      //   Icons.image,
                      //   color: LIGHT_GREY,
                      // ),
                      // errorWidget: (context, url, error) =>
                      //     Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: BLACK,
                            fontSize: 11,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productCard(ProductModel product) {
    return isProductLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(product: product),
                ),
              );
            },
            child: Card(
              color: LIGHT_GREY,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: product.id.toString(),
                              child: Image.network(
                                product.imgPath!,
                                fit: BoxFit.fill,
                                width: 200,
                                // placeholder: (context, url) => Container(
                                //     color: WHITE,
                                //     child: Center(
                                //         child: Icon(
                                //       Icons.image,
                                //       color: LIGHT_GREY,
                                //       size: 35,
                                //     ))),
                                // errorWidget: (context, url, error) => Container(
                                //     color: WHITE,
                                //     child: Center(
                                //         child: Icon(
                                //       Icons.error,
                                //       color: LIGHT_GREY,
                                //       size: 35,
                                //     ))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.currencySymbol! +
                              product.unitPrice.toStringAsFixed(2),
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              fontSize: 24,
                              color: BLACK,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.name,
                          style: TextStyle(
                              fontFamily: 'GlobalFonts',
                              color: BLACK,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
