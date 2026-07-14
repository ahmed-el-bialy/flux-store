import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "Home View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              AppConstants.appName,
              style: AppTextStyles.fontBlue24Bold,
            ),
            centerTitle: true,
            elevation: 0,
            pinned: true,
            actions: [IconButton(onPressed: () {
              /// TODO: implement search functionality
            }, icon: Icon(Icons.search, size: 24.sp,))
            ],
          ),
        ],
      ),
    );
  }
}
