import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/app_text_button.dart';

class GuestView extends StatelessWidget {
  const GuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(24.r),
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 64.sp,
                  color: AppColors.blue,
                ),
              ),

              verticalSpacing(24),

              Text(
                "Welcome, Guest",
                style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 22.sp),
              ),

              verticalSpacing(8),

              Text(
                "Sign in to access your profile,\ntrack orders, and enjoy a personalized experience.",
                textAlign: TextAlign.center,
                style: AppTextStyles.fontGray14Regular.copyWith(
                  color: AppColors.grayText.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),

              verticalSpacing(32),

              AppTextButton(
                buttonText: "Login",
                borderRadius: 25.r,
                textStyle: AppTextStyles.fontWhite16Bold,
                onPressed: () {
                  context.pushNamed(RouteNames.signIn, null);
                },
              ),

              verticalSpacing(14),

              AppTextButton(
                buttonText: "Create Account",
                borderRadius: 25.r,
                backgroundColor: AppColors.fieldBgGray,
                textStyle: AppTextStyles.fontBlack14SemiBold.copyWith(
                  fontSize: 16.sp,
                ),
                onPressed: () {
                  context.pushNamed(RouteNames.signUp, null);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
