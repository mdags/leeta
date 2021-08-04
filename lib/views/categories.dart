import 'package:flutter/material.dart';
import 'package:leeta/models/category_model.dart';
import 'package:leeta/providers/api_provider.dart';
import 'package:leeta/views/products.dart';
import 'package:leeta/widgets/variables.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var list = <CategoryModel>[];
  bool _isLoading = false;

  void fetchList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await ApiProvider.fetchCategories();
      if (data != null) {
        list = data;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        title: Text("Categories"),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              padding: const EdgeInsets.all(20.0),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: List.generate(list.length, (index) {
                return categoryItem(list[index]);
              }),
            ),
    );
  }

  Widget categoryItem(CategoryModel category) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ProductsPage(
                  category: category,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: LIGHT_GREY),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: GREY)),
                  child: Image.network(category.imgPath!),
                  // Center(
                  //   child: Text(
                  //     list[i].name.substring(0, 1),
                  //     style: TextStyle(
                  //       fontFamily: 'GlobalFonts',
                  //       color: GREY,
                  //       fontSize: 50,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  category.name,
                  style: TextStyle(
                    fontFamily: 'GlobalFonts',
                    color: BLACK,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
