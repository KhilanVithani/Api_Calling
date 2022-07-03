import 'package:api_calling/data_controller.dart';
import 'package:api_calling/profill_page.dart';
import 'package:api_calling/user_detail_list_screen.dart';
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
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataConntroller dataConntroller = Get.put(DataConntroller());

  @override
  void initState() {
    dataConntroller.getUserInformationFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api calling data using getx"),
      ),
      body: Obx(
        () => dataConntroller.isDataLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (ctx, i) {
                  String image = '';
                  String title = '';
                  String subtitle = '';
                  try {
                    image = dataConntroller.result[i]['img'];
                  } catch (e) {
                    image = '';
                  }

                  try {
                    title = dataConntroller.result[i]['name'];
                  } catch (e) {
                    title = '';
                  }

                  try {
                    subtitle = dataConntroller.result[i]['email'];
                  } catch (e) {
                    subtitle = '';
                  }

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        ProfillPage(index: i),
                      );
                    },
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          print("object");
                          Get.defaultDialog(
                            title: "Image",
                            content: CachedNetworkImage(
                              imageUrl:
                                  "https://dsrsoftech.com/vishal/argon/img/" +
                                      image,
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: "https://dsrsoftech.com/vishal/argon/img/" +
                              image,
                          errorWidget: (context, url, error) => Text("error"),
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 20,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                      title: Text(title),
                      subtitle: Text(subtitle),
                    ),
                  );
                },
                itemCount: dataConntroller.result.length,
              ),
      ),
    );
  }
}
