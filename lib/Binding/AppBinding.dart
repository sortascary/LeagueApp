import 'package:get/get.dart';
import 'package:learning_navbar/controllers/dashboard_controller.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}