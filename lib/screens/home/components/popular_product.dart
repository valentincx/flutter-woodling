import 'package:flutter/material.dart';
import 'package:woodling/components/product_card.dart';
import 'package:woodling/models/Product.dart';

import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: GridView.builder(
            itemCount: demoProducts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
              SizeConfig.orientation == Orientation.landscape ? 3 : 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: demoProducts[index]);
            }
          ),
        ),
      ],
    );
  }
}
