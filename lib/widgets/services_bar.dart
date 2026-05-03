import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/views/main_view.dart';

import '../views/category_search_view.dart';
import '../core/constants/constants.dart';

class ServicesBar extends StatelessWidget {
  const ServicesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      color: Color(kMainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainView.id,
                  (route) => false,
                );
              },
              icon: Icon(Icons.home, size: 28.sp, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategorySearch();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search, size: 28.sp, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, size: 28.sp, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, size: 28.sp, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_rounded,
                size: 28.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
