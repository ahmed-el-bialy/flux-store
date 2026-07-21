import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              onTap: () {},
            ),
            CustomDivider(),
            SettingsTile(
              icon: Icons.location_on_outlined,
              title: "Shipping Address",
              subtitle: "Manage delivery addresses",
              onTap: () {},
            ),
            CustomDivider(),
            SettingsTile(
              icon: Icons.payment_outlined,
              title: "Payment Methods",
              subtitle: "Manage your payment cards",
              onTap: () {},
            ),
            CustomDivider(),
            SettingsTile(
              icon: Icons.favorite_border_rounded,
              title: "Wishlist",
              subtitle: "Products you love",
              onTap: () {},
            ),
            CustomDivider(),
            SettingsTile(
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
}
