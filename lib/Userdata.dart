// ignore_for_file: deprecated_member_use

import 'package:api_calling/data_controller.dart';
import 'package:api_calling/profill_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  DataConntroller dataConntroller = Get.put(DataConntroller());
  @override
  void initState() {
    dataConntroller.getUserInformationFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Data From Api"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
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

                      if (dataConntroller.result == '') {
                        return Text("Data not found");
                      } else {
                        return ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              print("hello");
                              Get.defaultDialog(
                                //title: "",
                                content: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: PhotoView(
                                    imageProvider: NetworkImage(
                                      "https://dsrsoftech.com/vishal/argon/img/" +
                                          image,
                                    ),
                                    minScale:
                                        PhotoViewComputedScale.contained * 0.8,
                                    maxScale:
                                        PhotoViewComputedScale.covered * 2,
                                  ),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://dsrsoftech.com/vishal/argon/img/" +
                                      image,
                              errorWidget: (context, url, error) =>
                                  Text("error"),
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
                          trailing: IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                middleText: "Are you sure to delete this user",
                                cancel: RaisedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Cancel"),
                                ),
                                confirm: RaisedButton(
                                  onPressed: () async {
                                    await dataConntroller.DeleteDataFromApi(
                                        dataConntroller.result[i]['email']);
                                    dataConntroller.getUserInformationFromApi();
                                    Get.back();
                                  },
                                  child: Text("Delete"),
                                  color: Colors.red,
                                ),
                              );
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                          onTap: () {
                            Get.to(
                              ProfillPage(index: i),
                            );
                          },
                        );
                      }
                    },
                    itemCount: dataConntroller.result.length,
                  ),
          ),
        ),
      ),
    );
  }
}
