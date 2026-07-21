import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';

import '../../../auth/data/models/login_response_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.user});

  final LoginResponseModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.blue, AppColors.focusedBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.white.withValues(alpha: 0.2),
            backgroundImage: NetworkImage(user.image),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: AppTextStyles.fontWhite16Bold.copyWith(
                    fontSize: 18.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpacing(4),
                Text(
                  user.email,
                  style: AppTextStyles.fontGray14Regular.copyWith(
                    color: AppColors.white.withValues(alpha: 0.8),
                    fontSize: 13.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpacing(2),
                Text(
                  "@${user.username}",
                  style: AppTextStyles.fontGray14Regular.copyWith(
                    color: AppColors.white.withValues(alpha: 0.6),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
