import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../helper/routing_extension.dart';
import '../routing/route_names.dart';
import '../theming/app_colors.dart';

/// Data model representing a navigation item in [AppNavigationBar].
class NavItemData {
  final IconData icon;
  final IconData? selectedIcon;
  final String? label;
  final String? routeName;
  final int badgeCount;

  const NavItemData({
    required this.icon,
    this.selectedIcon,
    this.label,
    this.routeName,
    this.badgeCount = 0,
  });
}

/// A highly customizable, professional glassmorphism Navigation Bar widget
/// designed for maximum reusability across Flutter projects.
class AppNavigationBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onItemTapped;
  final List<NavItemData>? customItems;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;
  final double? height;
  final double? borderRadius;
  final double? blurSigma;

  const AppNavigationBar({
    super.key,
    required this.activeIndex,
    this.onItemTapped,
    this.customItems,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.height,
    this.borderRadius,
    this.blurSigma,
  });

  @override
  Widget build(BuildContext context) {
    final activeCol = activeColor ?? AppColors.focusedBlue;
    final inactiveCol = inactiveColor ?? AppColors.grayText;
    final radius = borderRadius ?? 25.r;
    final barHeight = height ?? 62.h;
    final blur = blurSigma ?? 5.0;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartBadgeCount = context.watch<CartCubit>().totalItemsCount;

        final items = customItems ?? [
          const NavItemData(
            icon: Icons.home_rounded,
            label: 'Home',
            routeName: RouteNames.home,
          ),
          const NavItemData(
            icon: Icons.category_rounded,
            label: 'Categories',
            routeName: RouteNames.categories,
          ),
          NavItemData(
            icon: Icons.shopping_cart_rounded,
            label: 'Cart',
            routeName: RouteNames.cart,
            badgeCount: cartBadgeCount,
          ),
          const NavItemData(
            icon: Icons.person_rounded,
            label: 'Profile',
            routeName: RouteNames.profile,
          ),
        ];

        return Padding(
          padding: EdgeInsets.only(bottom: 10.h, left: 18.w, right: 18.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                height: barHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black.withValues(alpha: 0.15),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                  color: (backgroundColor ?? AppColors.white).withValues(alpha: 0.65),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(radius),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      final isSelected = activeIndex == index;
                      final iconData = (isSelected && item.selectedIcon != null)
                          ? item.selectedIcon!
                          : item.icon;

                      return _buildNavItem(
                        context: context,
                        index: index,
                        item: item,
                        iconData: iconData,
                        isSelected: isSelected,
                        activeColor: activeCol,
                        inactiveColor: inactiveCol,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required NavItemData item,
    required IconData iconData,
    required bool isSelected,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return InkWell(
      splashColor: activeColor.withValues(alpha: 0.2),
      highlightColor: activeColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        if (onItemTapped != null) {
          onItemTapped!(index);
        } else if (activeIndex != index && item.routeName != null) {
          context.pushReplacementNamed(item.routeName!, null);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Icon(
              iconData,
              size: 26.sp,
              color: isSelected ? activeColor : inactiveColor,
            ),
            if (item.badgeCount > 0)
              Positioned(
                top: -4.h,
                right: -8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.redError,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1.5),
                  ),
                  constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
                  child: Center(
                    child: Text(
                      item.badgeCount > 99 ? '99+' : '${item.badgeCount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
