import 'package:flutter/material.dart';
import 'package:flux_store/core/widgets/app_navigation_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: AppNavigationBar(activeIndex: 1));
  }
}
