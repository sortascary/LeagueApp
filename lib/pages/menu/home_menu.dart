import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to the League App!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Icon(Icons.sports_soccer_rounded,
          size: 130,),
        ],
      ),
      )
    );
  }
}
