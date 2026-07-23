import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/routing_extension.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../logic/wishlist_cubit.dart';
import 'widgets/wishlist_empty_state.dart';
import 'widgets/wishlist_item_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: AppColors.black,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "My Wishlist",
          style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final wishlistCubit = context.watch<WishlistCubit>();
          final items = wishlistCubit.wishlistItems;

          if (items.isEmpty) {
            return const WishlistEmptyState();
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: items.length,
            separatorBuilder: (context, index) => verticalSpacing(12),
            itemBuilder: (context, index) {
              final product = items[index];
              return WishlistItemCard(product: product);
            },
          );
        },
      ),
    );
  }
}
