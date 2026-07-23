import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';
import 'package:flux_store/features/profile/ui/screens/authenticated_view.dart';
import 'package:flux_store/features/profile/ui/screens/guest_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You have been logged out.'),
              backgroundColor: AppColors.blue,
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.redError,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: state is AuthSuccess
              ? AuthenticatedView(state: state)
              : GuestView(),
        );
      },
    );
  }
}
