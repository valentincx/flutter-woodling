import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woodling/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenHeight(30)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(22),
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              height: 1.2
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          product.designer,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kSecondaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(30),
                    getProportionateScreenWidth(15),
                    getProportionateScreenWidth(30),
                    getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(
                    "\$${product.price}",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (product.isDeliverable)
                IconButton(
                    padding: EdgeInsets.all(10),
                    tooltip: 'Free Delivery',
                    icon: SvgPicture.asset(
                      "assets/icons/delivery.svg",
                      color: kSecondaryColor,
                      height: getProportionateScreenWidth(30),
                      width: getProportionateScreenWidth(30),
                    ),
                    onPressed: () {
                    }
                ),
              if (product.isPickUp)
                IconButton(
                    padding: EdgeInsets.all(10),
                    tooltip: 'Pick-up point',
                    icon: SvgPicture.asset(
                        "assets/icons/Location point.svg",
                        color: kSecondaryColor,
                        height: getProportionateScreenWidth(30),
                        width: getProportionateScreenWidth(30),
                    ),
                    onPressed: () {
                    }
                ),
              if (product.isGuaranteed)
                IconButton(
                    padding: EdgeInsets.all(10),
                    tooltip: 'Guaranteed',
                    icon: SvgPicture.asset(
                      "assets/icons/security.svg",
                      color: kSecondaryColor,
                      height: getProportionateScreenWidth(30),
                      width: getProportionateScreenWidth(30),
                    ),
                    onPressed: () {
                    }
                ),
              if (product.isAssembled)
                IconButton(
                    padding: EdgeInsets.all(10),
                    tooltip: 'Assembled Product',
                    icon: SvgPicture.asset(
                      "assets/icons/tools.svg",
                      color: kSecondaryColor,
                      height: getProportionateScreenWidth(30),
                      width: getProportionateScreenWidth(30),
                    ),
                    onPressed: () {
                    }
                ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.description,
            maxLines: 6,
            style: TextStyle(
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
      ],
    );
  }
}
