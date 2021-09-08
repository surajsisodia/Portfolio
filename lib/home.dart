import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/aboutPage.dart';
import 'package:my_portfolio/pages/namePage.dart';
import 'package:my_portfolio/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  bool showAppBar = false;
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.page == 0)
        showAppBar = false;
      else
        showAppBar = true;

      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              actions: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: selectColor,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Text("Home",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text('About',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    SizedBox(
                      width: 40,
                    ),
                    Text("Projects",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Skills',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Education',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Contact',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
      extendBodyBehindAppBar: true,
      backgroundColor: darkColor,
      body: PageView(
        controller: controller,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        onPageChanged: (page) {
          if (page > 0) {}
        },
        children: [
          AboutPage(),
          NamePage(),
        ],
      ),
    );
  }
}
