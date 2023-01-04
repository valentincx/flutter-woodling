import 'package:flutter/material.dart';
//debug
import 'package:woodling/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
//

import 'package:woodling/constants.dart';

import 'components/body.dart';
import 'package:woodling/screens/profile/profile_screen.dart';
import 'package:woodling/screens/categories/categories_screen.dart';
import 'package:woodling/screens/favorites/favorites_screen.dart';
import 'package:woodling/screens/cart/cart_screen.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  static String routeName = "/home";

  HomeScreen({Key key, this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 2;
  String _title;
  int selectedMaterialsFilters = 1;
  int selectedWoodsFilters = 1;

  RangeValues _currentRangeValues = const RangeValues(500, 8000);

  final _pageOptions = [
    CategoriesScreen(),
    CartScreen(),
    Body(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  // ignore: must_call_super
  initState(){
    _title = 'Explore';
  }

  @override
  Widget build(BuildContext context) {
    //debug
    //SizeConfig().init(context);
    //
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: kPrimaryColor,
          type : BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
              switch(index) {
                case 0: { _title = 'Categories'; }
                break;
                case 1: { _title = 'Cart'; }
                break;
                case 2: { _title = 'Explore'; }
                break;
                case 3: { _title = 'Favorites'; }
                break;
                case 4: { _title = 'Profile'; }
                break;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  size: 25.0,
                ),
                title: Text('Categories'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  size: 25.0,
                ),
                title: Text('Cart'),

            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 25.0,
                ),
                title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  size: 25.0,
                ),
                title: Text('Favorites'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 25.0,
                ),
                title: Text('Profile'),
            ),
          ],
        ),
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = 2;
              _title = 'Explore';
            });
            showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setModalState ) {
                        return Container(
                            height: SizeConfig.screenHeight * 0.85, /* We can give our required height */
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(60)),
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(10)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$ " + _currentRangeValues.start.round().toString(),
                                            style: TextStyle(
                                              fontSize: getProportionateScreenWidth(12),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2,
                                            ),
                                          ),
                                          Text("\$ "+ _currentRangeValues.end.round().toString(),
                                            style: TextStyle(
                                              fontSize: getProportionateScreenWidth(12),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2,
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                  RangeSlider(
                                    values: _currentRangeValues,
                                    min: 0,
                                    max: 10000,
                                    divisions: 20,
                                    activeColor: Colors.black,
                                    inactiveColor:kSecondaryColor.withOpacity(0.3),
                                    labels: RangeLabels(
                                      _currentRangeValues.start.round().toString(),
                                      _currentRangeValues.end.round().toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      setModalState(() {
                                        _currentRangeValues = values;
                                      });
                                    },
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(40)),
                                  Text(
                                    "Material",
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(10)),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        value: 1,
                                        groupValue: selectedMaterialsFilters,
                                        title: Text("Rope",
                                          style: TextStyle(
                                            color: selectedMaterialsFilters == 1 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedMaterialsFilters == 1 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentMaterialFilters) {
                                          setModalState(() {
                                            selectedMaterialsFilters = currentMaterialFilters;
                                          });
                                        },
                                        selected: selectedMaterialsFilters == selectedMaterialsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("750",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 2,
                                        groupValue: selectedMaterialsFilters,
                                        title: Text("Metal",
                                          style: TextStyle(
                                            color: selectedMaterialsFilters == 2 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedMaterialsFilters == 2 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentMaterialFilters) {
                                          setModalState(() {
                                            selectedMaterialsFilters = currentMaterialFilters;
                                          });
                                        },
                                        selected: selectedMaterialsFilters == selectedMaterialsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1150",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 3,
                                        groupValue: selectedMaterialsFilters,
                                        title: Text("Veneer",
                                          style: TextStyle(
                                            color: selectedMaterialsFilters == 3 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedMaterialsFilters == 3 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentMaterialFilters) {
                                          setModalState(() {
                                            selectedMaterialsFilters = currentMaterialFilters;
                                          });
                                        },
                                        selected: selectedMaterialsFilters == selectedMaterialsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1025",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 4,
                                        groupValue: selectedMaterialsFilters,
                                        title: Text("Glass",
                                          style: TextStyle(
                                            color: selectedMaterialsFilters == 4 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedMaterialsFilters == 4 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentMaterialFilters) {
                                          setModalState(() {
                                            selectedMaterialsFilters = currentMaterialFilters;
                                          });
                                        },
                                        selected: selectedMaterialsFilters == selectedMaterialsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1050",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(40)),
                                  Text(
                                    "Type of wood",
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(10)),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        value: 1,
                                        groupValue: selectedWoodsFilters,
                                        title: Text("Nut",
                                          style: TextStyle(
                                            color: selectedWoodsFilters == 1 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedWoodsFilters == 1 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentWoodsFilters) {
                                          setModalState(() {
                                            selectedWoodsFilters = currentWoodsFilters;
                                          });
                                        },
                                        selected: selectedWoodsFilters == selectedWoodsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("750",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 2,
                                        groupValue: selectedWoodsFilters,
                                        title: Text("Oak",
                                          style: TextStyle(
                                            color: selectedWoodsFilters == 2 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedWoodsFilters == 2 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentWoodFilters) {
                                          setModalState(() {
                                            selectedWoodsFilters = currentWoodFilters;
                                          });
                                        },
                                        selected: selectedWoodsFilters == selectedWoodsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1150",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 3,
                                        groupValue: selectedWoodsFilters,
                                        title: Text("Pine",
                                          style: TextStyle(
                                            color: selectedWoodsFilters == 3 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedWoodsFilters == 3 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentWoodFilters) {
                                          setModalState(() {
                                            selectedWoodsFilters = currentWoodFilters;
                                          });
                                        },
                                        selected: selectedWoodsFilters == selectedWoodsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1025",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                      RadioListTile(
                                        value: 4,
                                        groupValue: selectedWoodsFilters,
                                        title: Text("Mahagon",
                                          style: TextStyle(
                                            color: selectedWoodsFilters == 4 ? kPrimaryColor : Colors.black,
                                            fontWeight: selectedWoodsFilters == 4 ? FontWeight.w700: FontWeight.w500 ,
                                            height: 1.2,
                                          ),
                                        ),
                                        onChanged: (currentWoodFilters) {
                                          setModalState(() {
                                            selectedWoodsFilters = currentWoodFilters;
                                          });
                                        },
                                        selected: selectedWoodsFilters == selectedWoodsFilters,
                                        activeColor: kPrimaryColor,
                                        secondary: Text("1050",
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(40)),
                                ],
                              ),
                            )
                        );
                      }
                  );
                }
            );
          },
          child: SvgPicture.asset(
            'assets/icons/Menu.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      centerTitle: true,
      title:  Text(_title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kDarkColor,
            fontWeight: FontWeight.w600,
          )
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 8, 4),
          child: IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItem: 3,
            press: () {},
          ),
        )
      ],
    );
  }
}



