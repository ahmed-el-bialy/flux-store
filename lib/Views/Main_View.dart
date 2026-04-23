import 'package:flutter/material.dart';
import 'package:flux_store/Constants/Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/Products_List.dart';
import '../Widgets/ServicesBar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static String id = "Home View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(kMainColor),
        title: Text(
          "Flux Store",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.cartPlus, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Column(
        children: [ProductsList(), ServicesBar()],
      ),
    );
  }
}
