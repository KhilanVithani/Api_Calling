import 'package:api_calling/data_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfillPage extends StatefulWidget {
  var index;
  ProfillPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ProfillPage> createState() => _ProfillPageState();
}

class _ProfillPageState extends State<ProfillPage> {
  DataConntroller dataConntroller = Get.put(DataConntroller());

  @override
  Widget build(BuildContext context) {
    var name = dataConntroller.result[widget.index]['name'];
    var email = dataConntroller.result[widget.index]['email'];
    var mobile = dataConntroller.result[widget.index]['mobile'];
    var adr = dataConntroller.result[widget.index]['adr'];
    var gender = dataConntroller.result[widget.index]['gender'];
    var role = dataConntroller.result[widget.index]['role'];
    var salary = dataConntroller.result[widget.index]['salary'];
    var image = dataConntroller.result[widget.index]['img'];
    var joining = dataConntroller.result[widget.index]['joining'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Profill Page"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => dataConntroller.isDataLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
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
                            Text("Username: " + name),
                            Text("Email Id: " + email),
                            Text("Mobile no: " + mobile),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "Address : " + adr,
                                // textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Text("Gender: " + gender),
                            Text("Role : " + role),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "Salary : " + salary,
                                // textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Text("Joining Date: " + joining)
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
