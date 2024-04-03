import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hexcolor/hexcolor.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // Initializes screen dimensions based on the provided BuildContext
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  //Pre-defined small vertical spacing.
  static const spaceSmall = SizedBox(
    height: 25,
  );
  // Dynamic medium vertical spacing based on screen height.
  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );
  // Dynamic large vertical spacing based on screen height.
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  // Standard text field border styling.
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
      ));
  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));
//#FF928C
  // A central point  to define the app's primary color for consistent branding.
  static const primaryColor = Color(0xFFFF928C);
}
