import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/pages/dashboard_page.dart';
import 'package:learning_navbar/pages/login_page.dart';
import 'pages/dashboard_nav_drawer.dart';    

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        // list all pages here
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardPage(),
        ),
      ],
    );
  }
}