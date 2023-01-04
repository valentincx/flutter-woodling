import 'package:flutter/material.dart';

import 'Product.dart';

class Favorites {

  final Product product;

  Favorites({@required this.product});

  static List<Favorites> fetchAll() {
    List<Favorites> demoFavorites = [];
    for (var i = 0;  i < demoProducts.length; i++) {
      if (demoProducts[i].isFavourite) {
        demoFavorites.add(Favorites(product: demoProducts[i]));
      }
    }
    return demoFavorites;
  }

}