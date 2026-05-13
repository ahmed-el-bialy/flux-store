import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/data/repo/repo.dart';
import 'package:flux_store/data/web_services/web_services.dart';
import 'package:flux_store/widgets/services_bar.dart';
import '../data/models/category_model.dart';
import '../widgets/categories_list_builder.dart';
import '../widgets/custom_text_field.dart';
import '../core/constants/constants.dart';

class CategorySearch extends StatefulWidget {
  const CategorySearch({super.key});

  static String id = "Category Search View";

  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  late Future<List<CategoryModel>> future;

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    WebServices webServices = WebServices(dio);
    Repo repo = Repo(webServices);
    future = repo.getAllCategories();
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            FutureBuilder<List<CategoryModel>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0.h),
                          child: CustomTextField(categoryList: snapshot.data!),
                        ),
                        CategoriesListBuilder(categoryList: snapshot.data!),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height: 40.h),
                      Center(
                        child: CircularProgressIndicator(
                          color: Color(kMainColor),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text("There was an error");
                }
              },
            ),
            Spacer(flex: 1),
            ServicesBar(),
          ],
        ),
      ),
    );
  }
}
