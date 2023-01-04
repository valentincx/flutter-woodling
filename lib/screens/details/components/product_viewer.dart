import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../constants.dart';
import '../../../size_config.dart';

class Viewer extends StatefulWidget {
  final String name;
  const Viewer(this.name);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  List<ImageProvider> imageList = List<ImageProvider>();
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    print(widget.name);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    color: kPrimaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/close icon.svg",
                      height: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                (imagePrecached == true)
                    ? ImageView360(
                  key: UniqueKey(),
                  imageList: imageList,
                  autoRotate: autoRotate,
                  rotationCount: rotationCount,
                  rotationDirection: RotationDirection.anticlockwise,
                  frameChangeDuration: Duration(milliseconds: 150),
                  swipeSensitivity: swipeSensitivity,
                  allowSwipeToRotate: allowSwipeToRotate,
                  onImageIndexChanged: (currentImageIndex) {
                    print("currentImageIndex: $currentImageIndex");
                  },
                )
                    : Text("Pre-Caching images..."),
                SizedBox(height: getProportionateScreenHeight(0)),
              ],
            ),
          ),
      );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 8; i++) {
      imageList.add(AssetImage('assets/images/${widget.name}/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/images/${widget.name}/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}