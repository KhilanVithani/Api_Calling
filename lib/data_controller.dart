import 'dart:convert';
import 'package:api_calling/URL.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataConntroller extends GetxController {
  Url url = Url();
  var result;
  var isDataLoading = false.obs;
  getUserInformationFromApi() async {
    result = '';
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse(
          url.getalluserdata,
        )!,
      );

      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
        update();
        // user_list.add(User_Model_List.fromJson(result));
        print(result);
      } else {
        //
      }
    } catch (e) {
      print("Error while loading data is $e");
    } finally {
      isDataLoading(false);
    }
  }

  Future DeleteDataFromApi(String email) async {
    final response = await http.get(
      Uri.parse("${url.deleteUser}${email}"),
    );
    print("${url.deleteUser}${email}");
    // if (response.statusCode == 200) {
    //   return
    // } else {
    //   return print(1);
    // }
  }
}
