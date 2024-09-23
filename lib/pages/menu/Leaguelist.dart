import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/teamdata_controller.dart';
import 'package:learning_navbar/pages/Widget/card.dart';

class leagues extends StatelessWidget {
  final TeamdataController controller = Get.put(TeamdataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View the League"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
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
