import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product_model.dart';

class MainProductDetails extends StatefulWidget {
  const MainProductDetails({super.key, required this.model});

  final ProductModel model;

  @override
  State<MainProductDetails> createState() => _MainProductDetailsState();
}

class _MainProductDetailsState extends State<MainProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
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
                  child: Image.network(widget.model.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                widget.model.title,
                style: TextStyle(fontSize: 24.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "price : ${widget.model.price} \$",
                    style: TextStyle(fontSize: 22.sp, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.model.isFav;
                      });
                      widget.model.isFav = !widget.model.isFav;
                    },
                    icon: widget.model.isFav == false
                        ? Icon(
                            Icons.favorite,
                            color: Colors.grey[400],
                            size: 22.sp,
                          )
                        : Icon(Icons.favorite, color: Colors.red, size: 22.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
