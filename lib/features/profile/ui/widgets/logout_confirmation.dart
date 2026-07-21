import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';

void logoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Text(
        "Logout",
        style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
      ),
      content: Text(
        "Are you sure you want to logout?",
        style: AppTextStyles.fontGray14Regular,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text("Cancel", style: AppTextStyles.fontGray14Medium),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            context.read<AuthCubit>().logout();
          },
          child: Text(
            "Logout",
            style: AppTextStyles.fontBlue14Medium.copyWith(
              color: AppColors.redError,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
