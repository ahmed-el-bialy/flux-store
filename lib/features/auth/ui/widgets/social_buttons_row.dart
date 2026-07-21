import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/features/auth/data/models/social_provider.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';
import 'package:flux_store/features/auth/ui/widgets/build_social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildSocialButton(
              logoPath: 'assets/images/google_logo.png',
              backgroundColor: AppColors.fieldBgGray,
              isDisabled: isLoading,
              onTap: () => _handleSocialLogin(context, SocialProvider.google),
            ),
            BuildSocialButton(
              logoPath: 'assets/images/facebook_logo.png',
              backgroundColor: AppColors.fieldBgGray,
              isDisabled: isLoading,
              onTap: () => _handleSocialLogin(context, SocialProvider.facebook),
            ),
            BuildSocialButton(
              logoPath: 'assets/images/apple_logo.png',
              backgroundColor: AppColors.fieldBgGray,
              isDisabled: isLoading,
              onTap: () => _handleSocialLogin(context, SocialProvider.apple),
            ),
          ],
        );
      },
    );
  }

  void _handleSocialLogin(BuildContext context, SocialProvider provider) {
    context.read<AuthCubit>().socialLogin(provider: provider);
  }
}
