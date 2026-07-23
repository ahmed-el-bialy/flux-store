import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/routing_extension.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/image_place_holder.dart';
import '../../../cart/logic/cart_cubit.dart';
import '../../../home/data/models/product_model.dart';
import '../../logic/wishlist_cubit.dart';

class WishlistItemCard extends StatelessWidget {
  final ProductModel product;

  const WishlistItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldBgGray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          if (product.id != null) {
            context.pushNamed(RouteNames.details, product.id);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: SizedBox(
                  width: 75.w,
                  height: 75.h,
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ImagePlaceHolder(),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.grayText,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTextStyles.fontBlack14SemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(6),
                    Text(
                      "\$${product.price}",
                      style: AppTextStyles.fontBlue23Bold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.redFavorite,
                      size: 22.sp,
                    ),
                    onPressed: () {
                      context.read<WishlistCubit>().toggleFavorite(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Removed from Wishlist"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.blue,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.title} added to Cart!"),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
