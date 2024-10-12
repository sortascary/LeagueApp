import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/controllers/teamdata_controller.dart';
import 'package:learning_navbar/pages/Widget/card.dart';
import '../controllers/Task_controller.dart';

class favourites extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final LeaguedataController league = Get.put(LeaguedataController());

  @override
  Widget build(BuildContext context) {
    taskController.loadTasks(); // Load tasks when the screen opens

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return MyCard(
                    image: task.image,
                    teamname: task.title,
                    onTap: () {

                      league.togglelike(task.num);
                      taskController.deleteTask(task.id!);
                    },
                    facebook: task.facebook,
                    website: task.website,
                    twitter: task.twitter,
                    liked: (task.liked == 1).obs, 
                    num: task.num, // Ensure this is correct
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
