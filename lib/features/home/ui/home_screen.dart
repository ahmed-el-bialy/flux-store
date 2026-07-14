import 'package:flutter/material.dart';
import 'package:flux_store/core/theming/app_colors.dart';

import '../../../widgets/products_list.dart';
import '../../../widgets/services_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "Home View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Column(
        children: [ProductsList(), ServicesBar()],
      ),
    );
  }
}
