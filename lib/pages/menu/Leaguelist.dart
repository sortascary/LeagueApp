import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/teamdata_controller.dart';
import 'package:learning_navbar/pages/Widget/card.dart';

class leagues extends StatelessWidget {
  final LeaguedataController controller = Get.put(LeaguedataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View the Leagues"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.leagues.length,
          itemBuilder: (context, index) {
            final team = controller.leagues[index];
            final teamName = team['strLeague'];
            final teamImg = team['strBadge'];
            final teamfacebook = team['strFacebook'];
            final teamwebsite = team['strWebsite'];
            final teamtwitter = team['strTwitter'];

            return MyCard(
              image: teamImg,
              teamname: teamName,
              onTap: () {},
              facebook: teamfacebook,
              website: teamwebsite,
              twitter: teamtwitter,
            );
          },
        );
      }),
    );
  }
}
