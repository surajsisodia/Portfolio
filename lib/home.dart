import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/pages/aboutPage.dart';
import 'package:my_portfolio/pages/contactPage.dart';
import 'package:my_portfolio/pages/eduPage.dart';
import 'package:my_portfolio/pages/namePage.dart';
import 'package:my_portfolio/pages/projectPage.dart';
import 'package:my_portfolio/pages/skillPage.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  PageController controller = PageController(keepPage: true);

  bool showAppBar = false;
  bool showSwipe = true;
  late AnimationController animationController;
  late TabController tabController;
  double swipeOpacity = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.page! < 0.5)
        showAppBar = false;
      else
        showAppBar = true;

      if (controller.page == 0)
        swipeOpacity = 1;
      else
        swipeOpacity = 0;

      setState(() {});
    });

    animationController = AnimationController(vsync: this);
    tabController = TabController(length: 6, vsync: this);
    startAnimation();
  }

  startAnimation() async {
    await Future.delayed(Duration(milliseconds: 3500));
    swipeOpacity = 1;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: !showAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              actions: [
                if (b / 0.9 > h)
                  SizedBox(
                    width: 700,
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        Text("Home",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        Text('About',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        Text('Education',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        Text("Projects",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        Text('Skills',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        Text('Contact',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                      ],
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: selectColor),
                      onTap: (tab) {
                        controller.animateToPage(tab,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                    ),
                  ),
              ],
            ),
      extendBodyBehindAppBar: true,
      backgroundColor: darkColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              tabController.animateTo(page);
            },
            children: [
              NamePage(),
              AboutPage(),
              EduPage(),
              ProjectPage(),
              SkillPage(),
              ContactPage(),
            ],
          ),
          AnimatedOpacity(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 1000),
            opacity: swipeOpacity,
            child: GestureDetector(
              onTap: () {
                controller.animateToPage(1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Lottie.asset(
                  'assets/anim/swipe.json',
                  width: 100,
                ),
              ),
            ),
          ),
          if (b / 0.7 > h)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(min(15, b * 0.05)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await launch(
                            'https://www.instagram.com/the.hustler___/');
                      },
                      child: Image.asset(
                        'assets/images/instagram.png',
                        width: h * 0.02,
                      ),
                    ).showCursor.zoomInOnHover,
                    SizedBox(
                      width: h * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launch('https://www.linkedin.com/in/ss26/');
                      },
                      child: Image.asset(
                        'assets/images/linkedin.png',
                        width: h * 0.02,
                      ),
                    ).showCursor.zoomInOnHover,
                    SizedBox(
                      width: h * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launch('https://github.com/surajsisodia');
                      },
                      child: Image.asset(
                        'assets/images/github.png',
                        width: h * 0.02,
                      ),
                    ).showCursor.zoomInOnHover,
                    SizedBox(
                      width: h * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launch('https://twitter.com/marcos_suraj');
                      },
                      child: Image.asset(
                        'assets/images/twitter.png',
                        width: h * 0.02,
                      ),
                    ).showCursor.zoomInOnHover,
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
