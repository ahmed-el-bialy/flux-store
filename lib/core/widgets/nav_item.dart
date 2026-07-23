import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/routing_extension.dart';
import '../theming/app_colors.dart';
import 'app_navigation_bar.dart';

class NavItem extends StatelessWidget {
  final int index;
  final NavItemData item;
  final IconData iconData;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int>? onItemTapped;
  final int? activeIndex;

  const NavItem({
    super.key,
    required this.index,
    required this.item,
    required this.iconData,
    required this.isSelected,
    required this.activeColor,
    required this.inactiveColor,
    this.onItemTapped,
    this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
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
