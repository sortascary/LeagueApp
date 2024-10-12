import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LeaguedataController extends GetxController {
  var leagues = [].obs;
  var liked = <RxBool>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void togglelike(int index) async {
    final prefs = await SharedPreferences.getInstance();
    liked[index].value = !liked[index].value; // Toggle liked state
    prefs.setBool('liked_$index', liked[index].value);
  }

  void fetchData() async {
    final uri = Uri.parse("https://www.thesportsdb.com/api/v1/json/3/search_all_leagues.php?s=Soccer");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance(); // Get the SharedPreferences instance
      final json = jsonDecode(response.body);
      leagues.value = json['countries']; 
      

    liked.value = List<RxBool>.generate(leagues.length, (index) {
      return (prefs.getBool('liked_$index') ?? false).obs;
    });
      
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
