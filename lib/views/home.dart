import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:leeta/views/details.dart';
import 'package:leeta/widgets/side_menu.dart';
import 'package:leeta/widgets/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedItemIndex = 0;
  var isSelected = <bool>[];
  bool isCategoryLoaded = false;
  bool isSelectedCategoryLoaded = false;
  var categories = <Categories>[];
  var selectedCat = <SubCategory>[];
  int totalCartItems = 0;
  String cartImage1 = "";
  String cartImage2 = "";
  String cartImage3 = "";

  categorySelected(int category) async {
    setState(() {
      isSelectedCategoryLoaded = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categories.add(new Categories(
        1,
        "https://ak.picdn.net/shutterstock/videos/34850332/thumb/7.jpg",
        "Test"));
    categories.add(new Categories(
        2,
        "https://ak.picdn.net/shutterstock/videos/34850332/thumb/7.jpg",
        "Test 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 1",
        "5",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 2",
        "50",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 1",
        "5",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 2",
        "50",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 1",
        "5",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 2",
        "50",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 1",
        "5",
        "Test Desc 2"));
    selectedCat.add(new SubCategory(
        1,
        1,
        "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
        "Test 2",
        "50",
        "Test Desc 2"));

    for (int i = 0; i < categories.length; i++) {
      isSelected.add(false);
    }
    setState(() {
      isSelected[0] = !isSelected[0];
    });
  }

  closeDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      body: bodyWidget(),
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
                  InkWell(
                    child: Image.asset(
                      "assets/images/menu.png",
                      width: 25,
                      height: 15,
                      color: BLACK,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                      // Scaffold.of(context).openDrawer();
                    },
                  ),
                  CircleAvatar(
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
                  'Leeta',
                  style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return category(
                          categories[index].cat_icon!,
                          categories[index].cat_name!,
                          index,
                          categories[index].id);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Popular',
                  style: TextStyle(
                      fontFamily: 'GlobalFonts',
                      fontSize: 15,
                      color: BLACK,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                selectedCat.length == 0
                    ? Container(
                        height: 150,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(80),
                          child: Center(
                              child: FlareActor(
                            "assets/images/loading.flr",
                            fit: BoxFit.contain,
                            animation: "loading",
                          )),
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 5,
                        shrinkWrap: true,
                        childAspectRatio: 0.8,
                        physics: ClampingScrollPhysics(),
                        children: List.generate(selectedCat.length, (index) {
                          return subCategoryCard(
                            selectedCat[index].id,
                            selectedCat[index].menu_name!,
                            selectedCat[index].menu_image!,
                            selectedCat[index].price,
                            selectedCat[index].description,
                          );
                        }),
                      )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget category(String imagePath, String name, int index, int id) {
    return !isCategoryLoaded
        ? InkWell(
            onTap: () {
              setState(() {
                isSelected[selectedItemIndex] = false;
                selectedItemIndex = index;
                isSelected[index] = !isSelected[index];
                categorySelected(id);
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
                          CachedNetworkImage(
                            imageUrl: imagePath,
                            height: 25,
                            width: 25,
                            placeholder: (context, url) => Icon(
                              Icons.image,
                              color: LIGHT_GREY,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
          )
        : CircularProgressIndicator();
  }

  Widget subCategoryCard(
      int id, String name, String image, String price, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
                name: "Gourmet thin pesto amore",
                image:
                    "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png",
                description:
                    "Fall in love pesto all over  again with 10 thin crust topped with spinach, red onions",
                id: 1),
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
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.fill,
                        width: 200,
                        placeholder: (context, url) => Container(
                            color: WHITE,
                            child: Center(
                                child: Icon(
                              Icons.image,
                              color: LIGHT_GREY,
                              size: 35,
                            ))),
                        errorWidget: (context, url, error) => Container(
                            color: WHITE,
                            child: Center(
                                child: Icon(
                              Icons.error,
                              color: LIGHT_GREY,
                              size: 35,
                            ))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    price,
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
                    name,
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

class Categories {
  int id;
  String? cat_icon;
  String? cat_name;
  String? created_at;
  String? updated_at;

  Categories(this.id, this.cat_icon, this.cat_name);
}

class SubCategory {
  int id;
  int category;
  String description;
  String? menu_image;
  String? menu_name;
  String? created_at;
  String? updated_at;
  String price;

  SubCategory(this.id, this.category, this.menu_image, this.menu_name,
      this.price, this.description);
}
