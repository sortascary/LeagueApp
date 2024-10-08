import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/matchdata_controller.dart';
import 'package:learning_navbar/pages/Widget/mycolors.dart';

class HomeMenu extends StatelessWidget {
  final MatchdataController controller = Get.put(MatchdataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB5B00),
      appBar: AppBar(
        backgroundColor: colornav,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "League Matches", // Your text above the ListView
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.matches.length,
                itemBuilder: (context, index) {
                  final match = controller.matches[index];
                  final League = match['League'];
                  final teamH = match['HomeTeam'];
                  final teamA = match['AwayTeam'];
                  final goalH = match['HomeGoals'];
                  final goalA = match['AwayGoals'];

                  return Card(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(League),
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(teamH),
                                      Text(goalH),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('-'),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(teamA),
                                      Text(goalA),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
