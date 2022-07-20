// ignore_for_file: deprecated_member_use

import 'package:api_calling/data_controller.dart';
import 'package:api_calling/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ProfillPage extends StatefulWidget {
  var index;
  ProfillPage({required this.index});

  @override
  State<ProfillPage> createState() => _ProfillPageState();
}

class _ProfillPageState extends State<ProfillPage> {
  DataConntroller dataConntroller = Get.put(DataConntroller());

  @override
  Widget build(BuildContext context) {
    var name = dataConntroller.result[widget.index]['name'].toString();
    var email = dataConntroller.result[widget.index]['email'].toString();
    var mobile = dataConntroller.result[widget.index]['mobile'].toString();
    var adr = dataConntroller.result[widget.index]['adr'].toString();
    var gender = dataConntroller.result[widget.index]['gender'].toString();
    var role = dataConntroller.result[widget.index]['role'].toString();
    var salary = dataConntroller.result[widget.index]['salary'].toString();
    var image = dataConntroller.result[widget.index]['img'].toString();
    var joining = dataConntroller.result[widget.index]['joining'].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profill Page"),
      ),
      body: Center(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => dataConntroller.isDataLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.defaultDialog(
                                      // title: "Image",
                                      content: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: PhotoView(
                                          imageProvider: NetworkImage(
                                            "https://dsrsoftech.com/vishal/argon/img/" +
                                                image,
                                          ),
                                          minScale:
                                              PhotoViewComputedScale.contained *
                                                  0.8,
                                          maxScale:
                                              PhotoViewComputedScale.covered *
                                                  2,
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://dsrsoftech.com/vishal/argon/img/" +
                                              image,
                                      errorWidget: (context, url, error) =>
                                          Text("error"),
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 120,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.person_outline),
                              title: Text("Username:- " + name),
                            ),
                            ListTile(
                              leading: Icon(Icons.email_outlined),
                              title: Text("Email Id:- " + email),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone_outlined),
                              title: Text("Mobile:- " + mobile),
                            ),
                            ListTile(
                              leading: Icon(Icons.home_outlined),
                              title: Text(
                                "Address:- " + adr,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            ListTile(
                              leading: gender == 'Male'
                                  ? Icon(Icons.man_outlined)
                                  : Icon(Icons.woman_outlined),
                              title: Text("Gender:- " + gender),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.work_outline_outlined,
                              ),
                              title: Text("Role in company:- " + role),
                            ),
                            ListTile(
                              leading: Icon(Icons.currency_rupee_outlined),
                              title: Text(
                                "Salary:- " + salary,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_month_outlined,
                              ),
                              title: Text("Date of Joining:- " + joining),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
