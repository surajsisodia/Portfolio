import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;

    return Container(
      color: darkColor,
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        scale: 1,
                        image: AssetImage('assets/images/aboutImg.jpg'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "I'm ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300),
                          ),
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "a Flutter Developer",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: TextStyle(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              TypewriterAnimatedText(
                                "a Android Developer",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: TextStyle(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              TypewriterAnimatedText(
                                "an Indian",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: TextStyle(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Text(
                          "Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text, Sample Text,",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "About Me",
              style: TextStyle(
                color: Colors.white.withOpacity(0.1),
                fontSize: min(80, b * 0.14),
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
