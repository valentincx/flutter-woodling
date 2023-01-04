import 'package:flutter/material.dart';
import 'package:woodling/models/Favorites.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    Key key,
    @required this.favorites,
  }) : super(key: key);

  final Favorites favorites;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
              ),
              child: Image.asset(favorites.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              favorites.product.title,
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text(
              "\$${favorites.product.price}",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: kPrimaryColor),
            ),
          ],
        )
      ],
    );
  }
}
