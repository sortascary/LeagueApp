import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/dashboard_controller.dart';
import 'package:learning_navbar/pages/menu/home_menu.dart';
import 'package:learning_navbar/pages/menu/profile_menu.dart';
import 'package:learning_navbar/pages/menu/Leaguelist.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [HomeMenu(), leagues(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changeMenu,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer_outlined), label: "Leagues"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: "profile"),
            ]),
      );
    });
  }
}