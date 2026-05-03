import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_card_widget.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({super.key, required this.future});

  final dynamic future;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<ProductModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 8,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCardWidget(model: snapshot.data![index]);
                },
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Icon(
                      Icons
                          .signal_wifi_statusbar_connected_no_internet_4_rounded,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      " Please check your Wi-Fi Connection and click double click on home icon  ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
