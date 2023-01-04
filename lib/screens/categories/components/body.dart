import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'home_header.dart';
import 'categories.dart';

class Body extends StatelessWidget {

  final List<Map<String, String>> categoryData = [
    {
      "text": "Bedroom",
      "image": "assets/images/category_bedroom.png"
    },
    {
      "text": "Childish",
      "image": "assets/images/category_childish.png"
    },
    {
      "text": "Kitchen",
      "image": "assets/images/category_kitchen.png"
    },
    {
      "text": "Living room",
      "image": "assets/images/category_living_room.png"
    },
    {
      "text": "Bathroom",
      "image": "assets/images/category_bathroom.png"
    },
    {
      "text": "Bedroom",
      "image": "assets/images/category_cabinet.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                    child: GridView.builder(
                      itemCount: categoryData.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                        SizeConfig.orientation == Orientation.landscape ? 3 : 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.89,
                      ),
                      itemBuilder: (context, index) => Categories(
                        image: categoryData[index]["image"],
                        text: categoryData[index]['text'],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}
