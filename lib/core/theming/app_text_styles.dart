import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theming/app_colors.dart';

class AppTextStyles {
  static final TextStyle fontBlue24Bold = TextStyle(
    color: AppColors.blue,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle fontBlue14Medium = TextStyle(
    color: AppColors.blue,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle fontBlack18SimiBold = TextStyle(
    color: AppColors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
}
