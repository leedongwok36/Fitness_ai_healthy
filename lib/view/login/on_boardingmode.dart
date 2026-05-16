import 'package:flutter/material.dart';
//import 'on_boardingitem.dart';
//import 'on_boardingsreen.dart';
class OnboardingPageModel {
  final String title;
  final String description;
  final String bgImage;
  //final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    //required this.imageUrl,
    required this.bgImage,
    this.bgColor = Colors.black,

    this.textColor = Colors.white,
  });
}

