import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/app_text_button.dart';
import 'package:flux_store/features/auth/data/models/login_response_model.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';
import 'package:flux_store/features/profile/ui/widgets/avatar_card.dart';
import 'package:flux_store/features/profile/ui/widgets/logout_confirmation.dart';
import 'package:flux_store/features/profile/ui/widgets/settings_section.dart';

class AuthenticatedView extends StatefulWidget {
  const AuthenticatedView({super.key, required this.state});

  final AuthSuccess state;

  @override
  State<AuthenticatedView> createState() => _AuthenticatedViewState();
}

class _AuthenticatedViewState extends State<AuthenticatedView> {
  late LoginResponseModel user = widget.state.user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(20),

            // ── Header ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Text(
                    "My Profile",
                    style: AppTextStyles.fontBlack24Bold.copyWith(
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
            ),

            verticalSpacing(30),


            AvatarCard(user: user),

            verticalSpacing(30),

            SettingsSection(),

            verticalSpacing(30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppTextButton(
                buttonText: "Logout",
                borderRadius: 25.r,
                backgroundColor: AppColors.redError.withValues(alpha: 0.9),
                textStyle: AppTextStyles.fontWhite16Bold,
                onPressed: () {
                  logoutConfirmation(context);
                },
              ),
            ),

            verticalSpacing(30),
          ],
        ),
      ),
    );
  }
}
