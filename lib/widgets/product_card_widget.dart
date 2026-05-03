import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/models/product_model.dart';
import 'package:flux_store/views/product_view.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({super.key, required this.model});

  final ProductModel model;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductView(model: widget.model);
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),

          height: 300.h,
          width: MediaQuery.of(context).size.width * .5,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: AlignmentGeometry.topRight,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.network(
                              widget.model.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            widget.model.isFav = !widget.model.isFav;
                            setState(() {
                              widget.model.isFav;
                            });
                          },
                          icon: widget.model.isFav == false
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.grey[400],
                                  size: 32,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 32,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8,
                  ),
                  child: Text(
                    widget.model.title,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 2),
                        child: Text(
                          "${widget.model.price}\$",
                          style: TextStyle(
                            color: Colors.purple[700],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, bottom: 2),
                        child: Text(
                          "${widget.model.rate} ⭐",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
