import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woodling/screens/splash/splash_screen.dart';

import 'profile_pic.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ProfilePic(),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            padding: EdgeInsets.all(getProportionateScreenWidth(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Payment card",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/logo.svg",
                      height: getProportionateScreenWidth(35),
                    ),
                  ]
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                FittedBox(
                  fit: BoxFit.cover,
                  child:
                  Text(
                    "1234 5678 9101 1550",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      wordSpacing: 15,
                      letterSpacing: 3,
                    ),
                    maxLines: 1
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/card_chip.svg",
                      color: kSecondaryColor.withOpacity(0.3),
                      height: getProportionateScreenWidth(35),
                    ),
                    SvgPicture.asset(
                      "assets/icons/visa.svg",
                      color: kSecondaryColor.withOpacity(0.3),
                      height: getProportionateScreenWidth(50),
                    ),
                  ]
                ),
              ]
            )
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Address",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.black,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          height: getProportionateScreenWidth(40),
                          width: getProportionateScreenWidth(40),
                          decoration: BoxDecoration(
                            color: kBgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/Location point.svg"),
                            onPressed: () {
                            },
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(15)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home address",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              Text(
                                "19 Stuart, Boston, MA 02116",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(11),
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ]
                        ),
                      ]
                    ),
                    IconButton(
                      color: kSecondaryColor.withOpacity(0.3),
                      tooltip: 'More',
                      iconSize: 30.0,
                      icon: const Icon(Icons.more_vert_outlined),
                      onPressed: () {
                      }
                    ),
                  ]
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/map.png")
                    ),
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenWidth(30),
                width: getProportionateScreenWidth(30),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Icon(
                      Icons.add,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Phone",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.black,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              height: getProportionateScreenWidth(40),
                              width: getProportionateScreenWidth(40),
                              decoration: BoxDecoration(
                                color: kBgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset("assets/icons/Phone.svg"),
                                onPressed: () {
                                },
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(15)),
                            Text(
                              "+123 456 789",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ]
                        ),
                        IconButton(
                            color: kSecondaryColor.withOpacity(0.3),
                            tooltip: 'More',
                            iconSize: 30.0,
                            icon: const Icon(Icons.more_vert_outlined),
                            onPressed: () {
                            }
                        ),
                      ]
                  ),
                ],
              )
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenWidth(30),
                width: getProportionateScreenWidth(30),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Icon(
                      Icons.add,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.black,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                height: getProportionateScreenWidth(40),
                                width: getProportionateScreenWidth(40),
                                decoration: BoxDecoration(
                                  color: kBgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/icons/Bell.svg"),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(15)),
                              Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ]
                        ),
                        IconButton(
                            color: kSecondaryColor.withOpacity(0.3),
                            tooltip: 'More',
                            iconSize: 30.0,
                            icon: const Icon(Icons.expand_more_rounded),
                            onPressed: () {
                            }
                        ),
                      ]
                  ),
                ],
              )
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                height: getProportionateScreenWidth(40),
                                width: getProportionateScreenWidth(40),
                                decoration: BoxDecoration(
                                  color: kBgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/icons/Question mark.svg", color: Colors.black),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(15)),
                              Text(
                                "Help Center",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ]
                        ),
                        IconButton(
                            color: kSecondaryColor.withOpacity(0.3),
                            tooltip: 'More',
                            iconSize: 30.0,
                            icon: const Icon(Icons.expand_more_rounded),
                            onPressed: () {
                            }
                        ),
                      ]
                  ),
                ],
              )
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()), (Route<dynamic> route) => false);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                height: getProportionateScreenWidth(40),
                                width: getProportionateScreenWidth(40),
                                decoration: BoxDecoration(
                                  color: kBgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  icon: SvgPicture.asset("assets/icons/Log out.svg", color: Colors.black),
                                  onPressed: () {
                                  },
                                ),
                              ),
                              SizedBox(width: getProportionateScreenWidth(15)),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ]
                        ),
                      ]
                  ),
                ),
                ],
              )
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }
}
