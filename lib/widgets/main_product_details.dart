import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/widgets/image_place_holder.dart';

import '../features/home/data/models/product_model.dart';

class MainProductDetails extends StatelessWidget {
  const MainProductDetails({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Card(
        color: AppColors.lightBlue,
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: model.image ??"",
                    placeholder: (context, url) =>
                        ImagePlaceHolder(),
                    errorWidget: (context, url, error) => Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Icon(Icons.error, size: 30.sp),
                            Text(
                              "There was an error",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 24.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "price : ${model.price} \$",
                    style: TextStyle(fontSize: 22.sp, color: Colors.black),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.model.isFav;
                  //     });
                  //     widget.model.isFav = !widget.model.isFav;
                  //   },
                  //   icon: widget.model.isFav == false
                  //       ? Icon(
                  //           Icons.favorite,
                  //           color: Colors.grey[400],
                  //           size: 22.sp,
                  //         )
                  //       : Icon(Icons.favorite, color: Colors.red, size: 22.sp),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
