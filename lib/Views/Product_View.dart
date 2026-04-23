import 'package:flutter/material.dart';
import 'package:flux_store/Constants/Constants.dart';
import 'package:flux_store/Models/Product_Model.dart';
import 'package:flux_store/Widgets/ServicesBar.dart';

import '../Widgets/DetilsProductPart.dart';
import '../Widgets/MainProductPart.dart';
import '../Widgets/Reviews_List_Builder.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        automaticallyImplyActions: true,
        title: Text(model.title, style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),
        centerTitle: true,
        backgroundColor: Color(kMainColor),
      ),

      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                MainProductPart(model: model,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Divider(thickness: 3, endIndent: 10, indent: 10),
                  ),
                ),
                DetailsProductPart(model: model,),
                ReviewsListBuilder(reviews: model.reviews,),
              ],
            ),
          ),
          ServicesBar(),
        ],
      ),
    );
  }
}
