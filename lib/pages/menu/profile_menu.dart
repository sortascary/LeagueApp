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
            ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'lib/images/yee.jpeg',
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dzaky Ihsan Rasyid',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle_sharp),
                    title: Text('Presonalization'),
                    subtitle: Text('user preference settings'),
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
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
