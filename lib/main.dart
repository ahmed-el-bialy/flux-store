import 'package:flutter/material.dart';
import 'package:flux_store/Views/Category_Products.dart';
import 'package:flux_store/Views/Category_Search.dart';
import 'package:flux_store/Views/Main_View.dart';

void main() {
  runApp(FluxStore());
}

class FluxStore extends StatelessWidget {
  const FluxStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CategorySearch.id : (context )=> CategorySearch(),
        MainView.id : (context) => MainView(),
      },
        initialRoute: MainView.id,
        debugShowCheckedModeBanner: false, home: MainView());
  }
}
