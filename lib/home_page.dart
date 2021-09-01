import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xff121212),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                  baseColor: Colors.grey,
                  spawnMaxSpeed: 100,
                  spawnMinSpeed: 50)),
          vsync: this,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: h,
                    width: w * 0.15,
                    color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.2,
                        ),
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(0,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(w * 0.1))),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: w * 0.012,
                                  color: Colors.black),
                            ),
                          ),
                        ).showCursor,
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "Skills",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: w * 0.012,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(2,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "Projects",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: w * 0.012,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(3,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "Education",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: w * 0.012,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(4,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          child: Text(
                            "Contacts",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: w * 0.012,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: w * 0.85,
                    height: h,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (index == 1)
                            return getHomePage();
                          else if (index == 0)
                            return getProjectPage();
                          else
                            return getHomePage();
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  getSkillPage() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Skills",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: h * 0.05,
                    fontFamily: 'Poppins',
                  )),
            ],
          ),
          SizedBox(
            height: h * 0.15,
          ),
          Text("Languages",
              style: TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            height: h * 0.03,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(h * 0.011),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/cpp-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(h * 0.007),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/c-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(h * 0.008),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/dart-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(h * 0.01),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/java-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(h * 0.01),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/nodejs-icon.png'),
              ).showCursor.zoomInOnHover,
            ],
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Text("Frameworks/Technologies",
              style: TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            height: h * 0.03,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(h * 0.011),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/flutter-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(h * 0.011),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/android-icon.png'),
              ).showCursor.zoomInOnHover,
            ],
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Text("Databases",
              style: TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            height: h * 0.03,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(h * 0.015),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/sql-icon.png'),
              ).showCursor.zoomInOnHover,
              Container(
                margin: EdgeInsets.only(left: h * 0.020),
                padding: EdgeInsets.all(h * 0.011),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/hive-icon.png'),
              ).showCursor.zoomInOnHover,
            ],
          ),
          SizedBox(
            height: h * 0.04,
          ),
          Text("Back-End ",
              style: TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            height: h * 0.03,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(h * 0.015),
                width: h * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/firebase-icon.png'),
              ).showCursor.zoomInOnHover,
            ],
          ),
        ],
      ),
    );
  }

  getProjectPage() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Projects",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: h * 0.05,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(
            height: w / 8,
          ),
          Padding(
            padding: EdgeInsets.all(w / 40),
            child: Row(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: w / 50),
                  shadowColor: Colors.grey,
                  color: Color(0xff1e212d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                  child: Container(
                    height: w / 5,
                    width: w / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w / 60),
                          child: Text(
                            "GlowCal",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: w / 80,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/images/glowcal.png",
                          width: w / 8,
                          height: w / 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Repo Link",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 160,
                                  fontFamily: "Poppins"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: w / 50),
                  shadowColor: Colors.grey,
                  color: Color(0xff1e212d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                  child: Container(
                    height: w / 5,
                    width: w / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w / 60),
                          child: Text(
                            "ConJoin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: w / 80,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/images/co.png",
                          width: w / 8,
                          height: w / 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Repo Link",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 160,
                                  fontFamily: "Poppins"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: w / 50),
                  shadowColor: Colors.grey,
                  color: Color(0xff1e212d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                  child: Container(
                    height: w / 5,
                    width: w / 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w / 60),
                          child: Text(
                            "ConJoin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: w / 80,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/images/co.png",
                          width: w / 8,
                          height: w / 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Repo Link",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 160,
                                  fontFamily: "Poppins"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 100,
              width: 100,
              child: Column(
                children: [
                  Text("GlowCal"),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/glowcal.png",
                    width: w / 3.5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getHomePage() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: w * 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Hi! I'm ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              AnimatedTextKit(
                totalRepeatCount: 1,
                repeatForever: false,
                animatedTexts: [
                  TypewriterAnimatedText("Suraj Sisodia",
                      curve: Curves.ease,
                      speed: Duration(milliseconds: 100),
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: w * 0.04)),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            child: Row(
              children: [
                // Text("I'm a ",
                //     style:
                //         TextStyle(color: Colors.white, fontSize: 30)),
                AnimatedTextKit(
                  pause: Duration(microseconds: 500),
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText("Flutter",
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 30)),
                    RotateAnimatedText("Indian",
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 30)),
                    RotateAnimatedText("Android",
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 30)),
                    RotateAnimatedText("Video Editing",
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
