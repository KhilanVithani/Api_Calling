import 'package:api_calling/data_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailListScreen extends StatefulWidget {
  const UserDetailListScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailListScreen> createState() => _UserDetailListScreenState();
}

class _UserDetailListScreenState extends State<UserDetailListScreen> {
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
        title: Text("Data From api"),
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

                  return ListTile(
                    leading: CircleAvatar(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://dsrsoftech.com/vishal/argon/img/" + image,
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                    title: Text(title),
                    subtitle: Text(subtitle),
                  );
                },
                itemCount: dataConntroller.result.length,
              ),
      ),
    );
  }
}
