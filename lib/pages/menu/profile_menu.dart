import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/Login_controller.dart';

class ProfileMenu extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE4003A),
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  authController.logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pengguna',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        Icon(color: Colors.white, Icons.account_circle_sharp),
                    title: Text('Presonalization'),
                    subtitle: Text('user preference settings'),
                  ),
                  ListTile(
                    leading: Icon(color: Colors.white, Icons.help),
                    title: Text('Bantuan'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
