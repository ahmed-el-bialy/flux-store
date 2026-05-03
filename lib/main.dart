import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/views/category_products_view.dart';
import 'package:flux_store/views/category_search_view.dart';
import 'package:flux_store/views/main_view.dart';

void main() {
  runApp(FluxStore());
}

class FluxStore extends StatelessWidget {
  const FluxStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        routes: {
          CategorySearch.id: (context) => CategorySearch(),
          MainView.id: (context) => MainView(),
        },
        initialRoute: MainView.id,
        debugShowCheckedModeBanner: false,
        home: MainView(),
      ),
    );
  }
}
