import 'package:flutter/material.dart';
import 'package:flux_store/Models/Category_Model.dart';
import 'package:flux_store/Services/Category_List_Services.dart';

import '../Constants/Constants.dart';
import '../Widgets/CategoriesListBuilder.dart';
import '../Widgets/Custom_Text_Field.dart';

class CategorySearch extends StatefulWidget {
  const CategorySearch({super.key});

  static String id = "Category Search View";

  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  var future;

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  void getData() {
    future = CategoryListServices().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Search by Category",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Color(kMainColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<CategoryModel>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomTextField(categoryList: snapshot.data!),
                      ),
                      CategoriesListBuilder(categoryList: snapshot.data!),
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text("There was an error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
