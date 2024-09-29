import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/Login_controller.dart';

class Loginpage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Legue App Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_soccer_rounded,
          size: 150,),
          SizedBox(height: 30,),
            TextField(
              onChanged: (value) => authController.email.value = value,
              decoration: InputDecoration(
                labelText: "User",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value) => authController.password.value = value,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
                ),
                onPressed: () => authController.login(),
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
