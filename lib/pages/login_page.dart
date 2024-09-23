import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/Login_controller.dart';

class Loginpage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => authController.email.value = value,
              decoration: InputDecoration(
                labelText: "User",
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value) => authController.password.value = value,
              decoration: InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authController.login(),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
