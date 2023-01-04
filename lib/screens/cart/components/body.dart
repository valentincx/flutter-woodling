import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodling/models/Cart.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import 'product_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int total;

  calcTotal() {
    for (var i = 0;  i < demoCarts.length; i++) {
      total = total + (demoCarts[i].product.price * demoCarts[i].numOfItem);
    }
  }

  updateTotal(int index) {
    setState(() {
      total = total - (demoCarts[index].product.price * demoCarts[index].numOfItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    total = 0;
    calcTotal();

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
                    itemCount: demoCarts.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Dismissible(
                        key: Key(demoCarts[index].product.id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            updateTotal(index);
                            demoCarts.removeAt(index);
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
                            child: CartCard(cart: demoCarts[index])
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child:  Text( "Swipe left to dismiss",
                      style: TextStyle(height:1.2, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.4), fontSize: 12),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                ],
              ),
            )
          ),
          //CheckoutCard(),
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w500,
                        color: kSecondaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: " \$$total",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: kPrimaryColor, // foreground
                    ),
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text('Next',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  )
                ]
            ),
          )
        ],
      //),
    );
  }
}
