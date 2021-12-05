import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: darkColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't be Shy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "say Hi !!!",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        color: Color(0xff242323),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          "Drop a mail at",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                launch('mailto:sisodiasuraj2000@gmail.com');
                              },
                              child: Text(
                                "sisodiasuraj2000@gmail.com",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Follow me on Social Media",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launch(
                                    'https://www.instagram.com/the.hustler___/');
                              },
                              child: Image.asset(
                                'assets/images/instagram-colour.png',
                                width: 50,
                              ),
                            ).showCursor.zoomInOnHoverSmall,
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch('https://www.linkedin.com/in/ss26/');
                              },
                              child: Image.asset(
                                'assets/images/linkedin-colour.png',
                                width: 50,
                              ),
                            ).showCursor.zoomInOnHoverSmall,
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch('https://twitter.com/marcos_suraj');
                              },
                              child: Image.asset(
                                'assets/images/twitter-colour.png',
                                width: 50,
                              ),
                            ).showCursor.zoomInOnHoverSmall
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Contact",
              style: TextStyle(
                color: Colors.white.withOpacity(0.1),
                fontSize: 80,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
