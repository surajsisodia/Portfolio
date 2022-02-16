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
import 'package:my_portfolio/utils/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

PageController controller = PageController(keepPage: true);

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool showAppBar = false;
  bool showSwipe = true;
  late AnimationController animationController;
  late TabController tabController;
  double swipeOpacity = 0;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: !showAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              actions: [
                if (ResponsiveWidget.isLargeScreen(context))
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
      drawer: ResponsiveWidget.isLargeScreen(context)
          ? null
          : Drawer(
              backgroundColor: darkColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  drawerItem("Home", 0, Icons.home),
                  drawerItem("About", 1, Icons.person),
                  drawerItem("Education", 2, Icons.book),
                  drawerItem("Projects", 3, Icons.work),
                  drawerItem("Skills", 4, Icons.settings),
                  drawerItem("Contacts", 5, Icons.email),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Follow me at"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Align(
                        alignment: Alignment.center, child: SocialHandles()),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Baseline(
                          baseline: 36,
                          baselineType: TextBaseline.alphabetic,
                          child: Text('Made with \u2665\n',
                              textAlign: TextAlign.center)),
                      Text(' using '),
                      Image.asset(
                        'assets/images/flutter-icon.png',
                        width: 16,
                      )
                    ],
                  ),
                  // Text("by Hustler"),
                  //SizedBox(height: 10)
                ],
              ),
            ),
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
                  child: SocialHandles()),
            ),
          if (ResponsiveWidget.isSmallScreen(context))
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: b * 0.04, vertical: b * 0.04),
                child: Image.asset(
                  'assets/images/menu.png',
                  width: b * 0.05,
                ),
              ),
            )
        ],
      ),
    );
  }

  drawerItem(String label, double pageNo, IconData icon) {
    return InkWell(
      onTap: () {
        controller.animateToPage(pageNo.floor(),
            duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        Navigator.of(context).pop();
      },
      child: ListTile(
        selectedColor: selectColor,
        selected: !controller.hasClients
            ? false
            : (controller.page! < (pageNo + 1)) && (controller.page! >= pageNo),
        leading: Icon(
          icon,
        ),
        title: Text(label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            )),
      ),
    );
  }
}

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            await launch('https://www.instagram.com/the.hustler___/');
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
    );
  }
}
