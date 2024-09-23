import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCard extends StatelessWidget {
  final String teamname;
  final String image;
  final String facebook;
  final String website;
  final String twitter;
  final VoidCallback onTap;

  const MyCard({
    super.key,
    required this.teamname,
    required this.image,
    required this.onTap, 
    required this.facebook, 
    required this.website, 
    required this.twitter,
  });

  @override
  Widget build(BuildContext context) {
    bool tapped = false;

    return GestureDetector(
      onTap: () {
        tapped = !tapped;

        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  height: 50,
                ),
              ),
              const SizedBox(width: 16.0),
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
                  Row(
                    children: [
                      const SizedBox(width: 10.0,),
                      GestureDetector(
                        onTap: () async {

                          final Uri url = Uri.parse(_ensureHttp(facebook));

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Icon(
                          Icons.facebook_outlined,
                        ),
                      ),

                      const SizedBox(width: 15.0,),

                      GestureDetector(
                        onTap: () async {
                       
                          final Uri url = Uri.parse(_ensureHttp(website));

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Icon(
                          Icons.public_sharp,
                        ),
                      ),

                      const SizedBox(width: 15.0,),

                      GestureDetector(
                        onTap: () async {
                          
                          final Uri url = Uri.parse(_ensureHttp(twitter));

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Icon(
                          FontAwesomeIcons.twitter,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
