import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/app_colors.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      child: Center(
        child: Shimmer.fromColors(
          baseColor: AppColors.black.withValues(alpha: 0.6),

          highlightColor: AppColors.blue.withValues(alpha: .4),

          child: Text(
            'Loading ...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
