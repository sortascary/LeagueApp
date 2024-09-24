import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learning_navbar/pages/menu/Leaguelist.dart';

class LeaguedataController extends GetxController {
  var leagues = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final uri = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_leagues.php?s=Soccer");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      leagues.value = json['countries'];
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
