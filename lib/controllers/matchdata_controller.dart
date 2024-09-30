import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MatchdataController extends GetxController {
  var matches = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final uri = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/3/latestsoccer.php");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      matches.value = json['teams']['Match'];
    } else {
      Get.snackbar(
        "Error",
        "Failed to fetch data",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }
}