import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';

class EduPage extends StatefulWidget {
  const EduPage({Key? key}) : super(key: key);

  @override
  _EduPageState createState() => _EduPageState();
}

class _EduPageState extends State<EduPage> {
  double midLineLength = 0;
  double circleRadius = 0;
  double schoolCardOpacity = 0;
  double collegeCardOpacity = 0;
  late double screenHeight;
  late double screenWidth;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  startAnimation() async {
    await Future.delayed(Duration(microseconds: 500));
    circleRadius = 30;
    setState(() {});

    await Future.delayed(Duration(seconds: 1));
    midLineLength = screenHeight * 0.7;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    schoolCardOpacity = 1;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 500));
    collegeCardOpacity = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveWidget(
      largeScreen: Container(
        color: darkColor,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (screenWidth > screenHeight)
                  AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    width: circleRadius,
                    height: circleRadius,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Spacer(),
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: schoolCardOpacity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    schoolCard(),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: Text(
                                        "2015 - 2019",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            color: selectColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (screenWidth > screenHeight)
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: midLineLength,
                        width: 5,
                        color: Colors.white,
                        curve: Curves.decelerate,
                      ),
                    Expanded(
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: collegeCardOpacity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.4,
                                ),
                                Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        "2019 - Present",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Poppins',
                                            color: selectColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    collegeCard()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            bottomTitle()
          ],
        ),
      ),
      smallScreen: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: schoolCardOpacity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    schoolCard(),
                    SizedBox(
                      width: 20,
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        "2015 - 2019",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: selectColor,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: collegeCardOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      collegeCard(),
                      SizedBox(
                        width: 20,
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "2019 - Present",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: selectColor,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        bottomTitle()
      ]),
    );
  }

  bottomTitle() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Education",
        style: TextStyle(
          color: Colors.white.withOpacity(0.1),
          fontSize: min(80, screenWidth * 0.14),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget collegeCard() {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        width: 400,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Indian Institute of Information Technology, Surat",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
              Text(
                "Bachelor of Technology",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
              Text(
                "Electronics & Communication Engineering",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "CGPA : 8.96",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget schoolCard() {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        width: 400,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MPSM Grace Convent Sr. Sec. School, Mathura",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
              Text(
                "HSC & SSC",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
              Text(
                "Non-Medical + Computer Science (C++)",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "89%",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
