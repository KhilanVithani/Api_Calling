// ignore_for_file: deprecated_member_use

import 'package:api_calling/HomeScreen.dart';
import 'package:api_calling/data_controller.dart';
import 'package:api_calling/profill_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: "Hello",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
