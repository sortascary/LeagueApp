import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import 'menu/home_menu.dart';
import 'menu/profile_menu.dart';
import 'menu/Leaguelist.dart';

class DashboardNavDrawer extends StatelessWidget {
  const DashboardNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
// connecting controller dengan UI
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [const HomeMenu(), leagues(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Navigation Example"),
        ),
        body: menus[dashboardController.selectedIndex.value],
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                onTap: () {
                  dashboardController.changeMenu(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text("Transactions"),
                onTap: () {
                  dashboardController.changeMenu(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outline),
                title: const Text("Profile"),
                onTap: () {
                  dashboardController.changeMenu(2);
                  Navigator.pop(context);
                },
              ),
              
            ],
          ),
        ),
      );
    });
  }
}