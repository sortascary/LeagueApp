import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/matchdata_controller.dart';

class HomeMenu extends StatelessWidget {
  final MatchdataController controller = Get.put(MatchdataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB5B00),
      appBar: AppBar(
        backgroundColor: Color(0xFFE4003A),
        title: Text("Home",
          style: TextStyle(
            color: Colors.white
          ),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
       body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.matches.length,
          itemBuilder: (context, index) {
            final match = controller.matches[index];
            final League = match['League'];

            return Card(
              color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(League)
                  ],
                ),
              ),
            );
          }
          );
       })
       
       
       //Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text("Welcome to the League App!",
      //     textAlign: TextAlign.center,
      //     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
      //     SizedBox(height: 20,),
      //     Icon(Icons.sports_soccer_rounded,
      //     size: 130,),
      //   ],
      // ),
      // )
    );
  }
}
