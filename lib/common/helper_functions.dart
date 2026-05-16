import 'package:flutter/material.dart';

class THelepFunction {
  static Color? getColor(String value) {
    if (value == 'Green') {
      //return Color.green;
    } else if (value == 'Red') {
      //return Color.red;
    }
    return null;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String truncateText(String text, int maxLeght) {
    if (text.length <= maxLeght) {
      return text;
    } else {
      return '${text.substring(0, maxLeght)}...';
    }
  }

  //static Size screenSize() {
  //  return MediaQuery.of(Get.context!).size;
  //}

 // static double screenHeight() {
 //   return MediaQuery.of(Get.context!).size.height;
  //}
}
