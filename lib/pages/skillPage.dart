import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> with TickerProviderStateMixin {
  double sideLineHeight = 0;
  late final AnimationController controller1;
  late final AnimationController controller2;
  late final AnimationController controller3;
  late final AnimationController controller4;
  late final Animation<double> animation1;
  late final Animation<double> animation2;
  late final Animation<double> animation3;
  late final Animation<double> animation4;
  @override
  void initState() {
    startAnim();

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller4 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller1);
    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller2);
    animation3 = Tween(begin: 0.0, end: 1.0).animate(controller3);
    animation4 = Tween(begin: 0.0, end: 1.0).animate(controller4);
    super.initState();
  }

  startAnim() async {
    await Future.delayed(Duration(seconds: 1));
    sideLineHeight = 700;
    setState(() {});

    await Future.delayed(Duration(seconds: 1));
    controller1.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller2.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller3.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller4.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
      color: darkColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 5,
                    height: sideLineHeight,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: animation1,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Languages",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            skillIcon('assets/images/c-icon.png', "C"),
                            skillIcon('assets/images/cpp-icon.png', "C++"),
                            skillIcon('assets/images/dart-icon.png', "Dart"),
                            skillIcon('assets/images/java-icon.png', "Java"),
                            skillIcon(
                                'assets/images/kotlin-icon.png', "Kotlin"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeTransition(
                        opacity: animation2,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Frameworks/Technologies",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            skillIcon(
                                'assets/images/flutter-icon.png', "Flutter"),
                            skillIcon(
                                'assets/images/android-icon.png', "Android"),
                            skillIcon(
                                'assets/images/nodejs-icon.png', "Node JS"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeTransition(
                        opacity: animation3,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Databases",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            skillIcon('assets/images/sql-icon.png', "SQL"),
                            skillIcon('assets/images/hive-icon.png', "HiveDB"),
                            skillIcon('assets/images/roomdb-icon.png', "Room"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeTransition(
                        opacity: animation4,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Misc.",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            skillIcon(
                                'assets/images/firebase-icon.png', "Firebase"),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 7,
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Skills",
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

  skillIcon(String file, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Image.asset(
            file,
            height: 70,
            width: 70,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
