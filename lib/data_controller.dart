import 'dart:convert';
import 'package:api_calling/models/user_model_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataConntroller extends GetxController {
  var user_list = [];
  var result;
  var isDataLoading = false.obs;
  getUserInformationFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse(
          "https://dsrsoftech.com/vishal/argon/get_all_users.php",
        )!,
      );

      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
        // user_list.add(User_Model_List.fromJson(result));
        print(result);
      } else {
        //error
      }
    } catch (e) {
      print("Error while loading data is $e");
    } finally {
      isDataLoading(false);
    }
  }
}
