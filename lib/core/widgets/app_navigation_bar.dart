import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';

import '../helper/routing_extension.dart';
import '../theming/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  final int activeIndex;

  const AppNavigationBar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 18.w, right: 18.w),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 62.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black, width: 1.1),
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.white.withValues(alpha: .6),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.r),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  homeScreen -> index = 0
                  InkWell(
                    splashColor: AppColors.black.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () {
                      if (activeIndex != 0) {
                        context.pushReplacementNamed(
                          AppConstants.homeScreen,
                          null,
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Icon(
                        Icons.home_rounded,
                        size: 28.sp,
                        color: activeIndex == 0
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),

                  //  categoriesScreen -> index = 1
                  InkWell(
                    splashColor: AppColors.blue.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () {
                      if (activeIndex != 1) {
                        // context.pushReplacementNamed(Strings.categoriesScreen, null);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Icon(
                        Icons.category_rounded,
                        size: 28.sp,
                        color: activeIndex == 1
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),

                  //  Cart -> index = 2
                  InkWell(
                    splashColor: AppColors.blue.withValues(alpha: .45),
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () {
                      if (activeIndex != 2) {
                        // context.pushReplacementNamed(Strings.CartScreen, null);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        size: 28.sp,
                        color: activeIndex == 2
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),

                  //  profile -> index = 3
                  InkWell(
                    splashColor: AppColors.blue.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(16.r),
                    onTap: () {
                      if (activeIndex != 3) {
                        // context.pushReplacementNamed(Strings.profileScreen, null);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Icon(
                        Icons.person_rounded,
                        size: 28.sp,
                        color: activeIndex == 3
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
