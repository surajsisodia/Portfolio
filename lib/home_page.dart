import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/bg.jpg',
          height: h,
          width: w,
          fit: BoxFit.cover,
        ),
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
                      _pageController.jumpToPage(0);
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: w * 0.012,
                          color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.jumpToPage(1);
                    },
                    child: Text(
                      "Skills",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: w * 0.012,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "Projects",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: w * 0.012,
                        color: Colors.white),
                  ),
                  Text(
                    "Education",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: w * 0.012,
                        color: Colors.white),
                  ),
                  Text(
                    "Contacts",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: w * 0.012,
                        color: Colors.white),
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
                    if (index == 0)
                      return getHomePage();
                    else if (index == 1)
                      return getSkillPage();
                    else
                      return getHomePage();
                  }),
            ),
          ],
        )
      ],
    ));
  }

  getSkillPage() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tools", style: TextStyle(color: Colors.white, fontSize: 30)),
          SizedBox(
            height: h * 0.03,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(w * 0.01),
                width: w * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/flutter-icon.png'),
              ),
              Container(
                margin: EdgeInsets.only(left: h * 0.015),
                padding: EdgeInsets.all(w * 0.01),
                width: w * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('assets/images/dart-icon.png'),
              ),
            ],
          )
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
