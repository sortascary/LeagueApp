import 'package:get/get.dart';
import 'package:learning_navbar/pages/dashboard_page.dart';
import 'package:learning_navbar/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    // Replace with your own validation logic
    if (email.value == 'Dzaky Ihsan Rasyid' && password.value == 'password') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email.value);
      Get.off(() => const DashboardPage());  // Navigate to HomeScreen
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials');
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email'); // Remove the stored email
    email.value = ''; // Clear the email variable
    Get.offAll(() => Loginpage()); // Navigate back to the login screen
  }
}
