import 'package:flutter/cupertino.dart';

double bmiValue;

const List<String> bmiAssetNames = <String>[
  'assets/images/underweight.svg',
  'assets/images/normal.svg',
  'assets/images/fat.svg',
  'assets/images/overweight.svg',
];

const String mainAssetImageName = 'assets/images/main.jpg';

const List<String> mentalHealthAssetNames = <String>[
  'assets/images/pale-mental-health.png',
  'assets/images/pablita-success.png',
  'assets/images/clip-end-of-quarantine-happy-and-joyful-girl-1.png',
  'assets/images/clip-remote-work-1.png',
  'assets/images/pablo-800.png'
];

List<Widget> images = <Widget>[];
String appDirPath;