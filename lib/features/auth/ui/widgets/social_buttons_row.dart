import 'package:flutter/material.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/features/auth/ui/widgets/build_social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildSocialButton(
          logoPath: "assets/images/google_logo.png",
          backgroundColor: AppColors.fieldBgGray,
          onTap: () {},
        ),
        BuildSocialButton(
          logoPath: "assets/images/facebook_logo.png",
          backgroundColor: AppColors.fieldBgGray,
          onTap: () {},
        ),
        BuildSocialButton(
          logoPath: "assets/images/apple_logo.png",
          backgroundColor: AppColors.fieldBgGray,
          onTap: () {},
        ),
      ],
    );
  }
}
