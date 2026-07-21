import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/app_navigation_bar.dart';
import 'package:flux_store/core/widgets/app_text_button.dart';
import 'package:flux_store/features/auth/logic/auth_cubit.dart';

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
              ? _buildAuthenticatedView(context, state)
              : _buildGuestView(context),
          bottomNavigationBar: const AppNavigationBar(activeIndex: 3),
        );
      },
    );
  }

  // ─── Authenticated View ──────────────────────────────────────────────

  Widget _buildAuthenticatedView(BuildContext context, AuthSuccess state) {
    final user = state.user;

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

            // ── Avatar Card ──
            Container(
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
            ),

            verticalSpacing(30),

            // ── Settings / Menu ──
            _buildSettingsSection(context),

            verticalSpacing(30),

            // ── Logout Button ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppTextButton(
                buttonText: "Logout",
                borderRadius: 25.r,
                backgroundColor: AppColors.redError.withValues(alpha: 0.9),
                textStyle: AppTextStyles.fontWhite16Bold,
                onPressed: () {
                  _showLogoutConfirmation(context);
                },
              ),
            ),

            verticalSpacing(30),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.fieldBgGray,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            _buildSettingsTile(
              icon: Icons.shopping_bag_outlined,
              title: "My Orders",
              subtitle: "Track & manage your orders",
              onTap: () {},
            ),
            _buildDivider(),
            _buildSettingsTile(
              icon: Icons.location_on_outlined,
              title: "Shipping Address",
              subtitle: "Manage delivery addresses",
              onTap: () {},
            ),
            _buildDivider(),
            _buildSettingsTile(
              icon: Icons.payment_outlined,
              title: "Payment Methods",
              subtitle: "Manage your payment cards",
              onTap: () {},
            ),
            _buildDivider(),
            _buildSettingsTile(
              icon: Icons.favorite_border_rounded,
              title: "Wishlist",
              subtitle: "Products you love",
              onTap: () {},
            ),
            _buildDivider(),
            _buildSettingsTile(
              icon: Icons.settings_outlined,
              title: "Settings",
              subtitle: "Notifications, password & more",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, size: 22.sp, color: AppColors.blue),
              ),
              horizontalSpacing(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.fontBlack14SemiBold,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.fontGray14Regular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.grayText.withValues(alpha: 0.5),
                size: 22.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 56.w,
      color: AppColors.borderGray.withValues(alpha: 0.5),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
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
            child: Text(
              "Cancel",
              style: AppTextStyles.fontGray14Medium,
            ),
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

  // ─── Guest View ──────────────────────────────────────────────────────

  Widget _buildGuestView(BuildContext context) {
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
                style: AppTextStyles.fontBlack24Bold.copyWith(
                  fontSize: 22.sp,
                ),
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
