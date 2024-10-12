import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:learning_navbar/Models/TaskModel.dart';
import 'package:learning_navbar/controllers/Task_controller.dart';
import 'package:learning_navbar/controllers/teamdata_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCard extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final LeaguedataController league = Get.put(LeaguedataController());

  final int num;
  final String teamname;
  final String image;
  final String facebook;
  final String website;
  final String twitter;
  final VoidCallback onTap;
  final RxBool liked;

  MyCard({
    super.key,
    required this.teamname,
    required this.image,
    required this.onTap,
    required this.facebook,
    required this.website,
    required this.twitter,
    required this.liked, 
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                height: 75,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamname,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(_ensureHttp(facebook));
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Icon(Icons.facebook_outlined),
                    ),
                    const SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(_ensureHttp(website));
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Icon(Icons.public_sharp),
                    ),
                    const SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(_ensureHttp(twitter));
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Icon(FontAwesomeIcons.twitter),
                    ),
                    const SizedBox(width: 20.0),
                    Obx(() => GestureDetector(
                          onTap: () {
                            
                            if (!liked.value) {
                              
                              TaskModel task = TaskModel(
                                  num: num,
                                  title: teamname,
                                  image: image, 
                                  website: website, 
                                  facebook: facebook, 
                                  twitter: twitter, 
                                  liked: liked.value? 0 : 1);
                                  
                              taskController.addTask(task);

                            } else if(liked.value){

                              if (taskController.tasks.isNotEmpty) {
                                try {
                                  final task = taskController.tasks.firstWhere(
                                      (task) => task.title == teamname);
                                  taskController.deleteTask(task.id!);
                                } catch (e) {
                                  print("Task not found: $e");
                                }
                              }

                            }
                            onTap();
                          },
                          child: Icon(
                            liked.value ? Icons.star : Icons.star_border,
                            color: liked.value ? Colors.yellow : Colors.black,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _ensureHttp(String url) {
    if (!url.startsWith('http')) {
      return 'https://$url';
    }
    return url;
  }
}
