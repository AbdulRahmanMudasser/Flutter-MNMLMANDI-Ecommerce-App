import 'package:flutter/cupertino.dart';

class AppSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;
  static late double defaultSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize = orientation == Orientation.landscape ? screenHeight * 0.024 : screenWidth * 0.024;
  }
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = AppSize.screenWidth;
  return (inputWidth / 812.0) * screenWidth;
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = AppSize.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}
