
import 'package:flutter/material.dart';
import 'package:flux_store/Constants/Constants.dart';
import 'package:flux_store/Views/Main_View.dart';

import '../Views/Category_Search.dart';

class ServicesBar extends StatelessWidget {
  const ServicesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 85,
      color: Color(kMainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {Navigator.pushNamedAndRemoveUntil(context, MainView.id, (route) => false,);},
              icon: Icon(Icons.home, size: 35,color: Colors.white,)
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
              icon: Icon(Icons.search, size: 35,color: Colors.white,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, size: 30,color: Colors.white,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, size: 30,color: Colors.white,),
            ),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_rounded, size: 35,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
