import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woodling/models/Product.dart';
import 'package:woodling/size_config.dart';
import 'package:woodling/screens/cart/cart_screen.dart';

import 'product_description.dart';
import 'product_images.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return /*SafeArea(
      child:*/ SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ListView (
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(50)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ProductImages(product: product),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 0, color: Color(0xFFFFFFFFFF))),
                color: Colors.black,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: ProductDescription(product: product),
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF000000),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buy now",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: getProportionateScreenWidth(48),
                              width: getProportionateScreenWidth(48),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset("assets/icons/basket.svg", width: 20, height: 20),
                                onPressed: () {
                                  Navigator.pushNamed(context, CartScreen.routeName);
                                },
                              ),
                            ),
                          ]
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
     // ),

    );
  }
}
