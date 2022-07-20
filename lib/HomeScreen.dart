import 'package:api_calling/Userdata.dart';
import 'package:api_calling/data_controller.dart';
import 'package:api_calling/profill_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'Get user data',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Get.to(UserData());
                  },
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Api calling data using getx"),
        ),
        body: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
