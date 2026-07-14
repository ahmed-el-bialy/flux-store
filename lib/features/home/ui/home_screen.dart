import 'package:cached_network_image/cached_network_image.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            actions: [
              IconButton(
                onPressed: () {
                  /// TODO: implement search functionality
                },
                icon: Icon(Icons.search, size: 24.sp),
              ),
            ],
          ),

          sliverVerticalSpacing(15),

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

          sliverVerticalSpacing(15),

          SliverToBoxAdapter(
            child: SectionTitle(sectionName: "Featured Products"),
          ),
          sliverVerticalSpacing(15),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors.orange,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://cdn.mos.cms.futurecdn.net/GXHa4PWwDPx7tGQG9MDQvK-650-80.jpg.webp",
                            ),
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                ///TODO: implement favorite functionality
                              },
                              icon: Icon(Icons.favorite),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("4.5"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(activeIndex: 0),
    );
  }
}
