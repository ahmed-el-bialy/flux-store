import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/section_title.dart';
import 'package:flux_store/features/home/data/local/categories_data.dart';
import 'package:flux_store/features/home/ui/widgets/category_item.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../../core/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
            actions: [
              IconButton(
                onPressed: () {
                  /// TODO: implement search functionality
                },
                icon: Icon(Icons.search, size: 24.sp),
              ),
            ],
          ),

          sliverVerticalSpacing(10),

          SliverToBoxAdapter(child: SectionTitle(sectionName: "Categories")),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return CategoryItem(model: categoryList[index]);
                },
              ),
            ),
          ),

          sliverVerticalSpacing(5),

          SliverToBoxAdapter(
            child: SectionTitle(sectionName: "Featured Products"),
          ),
          sliverVerticalSpacing(5),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.92,
              crossAxisCount: 2,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ItemCard();
            },
          ),
          sliverVerticalSpacing(20)
        ],
      ),
      bottomNavigationBar: AppNavigationBar(activeIndex: 0),
    );
  }
}
