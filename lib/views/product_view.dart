import 'package:flutter/material.dart';
import 'package:flux_store/models/product_model.dart';
import 'package:flux_store/widgets/services_bar.dart';
import '../widgets/more_product_details.dart';
import '../widgets/main_product_details.dart';
import '../widgets/reviews_list_builder.dart';
import '../core/constants/constants.dart';

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
        title: Text(
          model.title,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Color(kMainColor),
      ),

      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                MainProductDetails(model: model),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Divider(thickness: 3, endIndent: 10, indent: 10),
                  ),
                ),
                MoreProductDetails(model: model),
                ReviewsListBuilder(reviews: model.reviews),
              ],
            ),
          ),
          ServicesBar(),
        ],
      ),
    );
  }
}
