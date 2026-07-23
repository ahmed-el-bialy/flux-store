import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/logic/cart_cubit.dart';
import '../routing/route_names.dart';
import '../theming/app_colors.dart';
import 'nav_item.dart';

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

        final items =
            customItems ??
            [
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
                  color: (backgroundColor ?? AppColors.white).withValues(
                    alpha: 0.65,
                  ),
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

                      return NavItem(
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
}
