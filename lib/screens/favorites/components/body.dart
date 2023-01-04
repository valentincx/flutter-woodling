import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodling/models/Favorites.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import 'favorites_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final demoFavorites = Favorites.fetchAll();

  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  ListView.builder(
                    itemCount: demoFavorites.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) =>Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Dismissible(
                        key: Key(demoFavorites[index].product.id.toString()),
                        onDismissed: (direction) {
                          /*if (direction == DismissDirection.startToEnd) {
                            print("Add to favorite");
                          } else {
                            print('Remove item');
                          }*/
                          setState(() {
                            demoFavorites.removeAt(index);
                          });
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/basket.svg", width: 20, height: 20, color: kPrimaryColor,),
                              Spacer(),
                              SvgPicture.asset("assets/icons/Trash.svg"),
                            ],
                          ),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            //color: Colors.white,
                            child: FavoritesCard(favorites: demoFavorites[index])
                            //child: demoProducts[index].isFavourite ? ProductCard(product: demoProducts[index]) : Container()
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( "Swipe right to add to cart",
                          style: TextStyle(height:1.2, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.4), fontSize: 12),
                          maxLines: 1,
                        ),
                        Text( "Swipe left to dismiss",
                          style: TextStyle(height:1.2, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.4), fontSize: 12),
                          maxLines: 1,
                        ),

                      ],
                    )
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                ],
              ),
            )
          ),
        ],
    );
  }
}
