import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/Binding/AppBinding.dart';
import 'package:learning_navbar/controllers/Login_controller.dart';
import 'package:learning_navbar/pages/dashboard_page.dart';
import 'package:learning_navbar/pages/login_page.dart';
import 'pages/dashboard_nav_drawer.dart';    

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authController = Get.put(AuthController());
  
  bool loggedIn = await authController.isLoggedIn();

  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Appbinding(),
      initialRoute: loggedIn ? '/dashboard' : '/',
      getPages: [
        // list all pages here
        GetPage(
          name: '/',
          page: () => Loginpage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardPage(), binding: Appbinding(),
        ),
      ],
    );
  }
}
