import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/routing/route_names.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/features/profile/ui/widgets/custom_divider.dart';
import 'package:flux_store/features/profile/ui/widgets/settings_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.fieldBgGray,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            SettingsTile(
              icon: Icons.shopping_bag_outlined,
              title: "My Orders",
              subtitle: "Track & manage your orders",
              onTap: () {
                _showInfoBottomSheet(
                  context,
                  title: "My Orders",
                  icon: Icons.shopping_bag_outlined,
                  message: "You have 1 active order on the way! Estimated delivery: Tomorrow.",
                );
              },
            ),
            const CustomDivider(),
            SettingsTile(
              icon: Icons.location_on_outlined,
              title: "Shipping Address",
              subtitle: "Manage delivery addresses",
              onTap: () {
                _showInfoBottomSheet(
                  context,
                  title: "Shipping Address",
                  icon: Icons.location_on_outlined,
                  message: "Default Address: 123 Flux Street, Cairo, Egypt.",
                );
              },
            ),
            const CustomDivider(),
            SettingsTile(
              icon: Icons.payment_outlined,
              title: "Payment Methods",
              subtitle: "Manage your payment cards",
              onTap: () {
                _showInfoBottomSheet(
                  context,
                  title: "Payment Methods",
                  icon: Icons.payment_outlined,
                  message: "Primary Card: Visa ending in **** 4242",
                );
              },
            ),
            const CustomDivider(),
            SettingsTile(
              icon: Icons.favorite_border_rounded,
              title: "Wishlist",
              subtitle: "Products you love",
              onTap: () {
                context.pushNamed(RouteNames.wishlist, null);
              },
            ),
            const CustomDivider(),
            SettingsTile(
              icon: Icons.settings_outlined,
              title: "Settings",
              subtitle: "Notifications, password & more",
              onTap: () {
                _showInfoBottomSheet(
                  context,
                  title: "App Settings",
                  icon: Icons.settings_outlined,
                  message: "Notifications: Enabled\nCurrency: USD (\$)\nLanguage: English",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoBottomSheet(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String message,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40.sp, color: AppColors.blue),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grayText, fontSize: 14.sp),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
