import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late double b, h;

  @override
  Widget build(BuildContext context) {
    b = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    List<Widget> projectWidgets = [
      projectCard(
          image: 'assets/images/glowcal.png',
          title: "GlowCal",
          des:
              "A Food Donation mobile application, build upon Flutter framework, to satisfy hunger of the needy ones. The app provides a complete platform to NGOs and donator(having excess food, eg. party, marraige) to connect with each other. Encouraging donars by coupons, on each donation they do.",
          link: 'https://github.com/surajsisodia/GlowCal-Flutter-GDSC-2021'),
      projectCard(
          image: 'assets/images/askthrifty.png',
          title: "AskThrifty",
          des:
              "A Quora like mobile application, providing a platform to users to post their curious question and polls. Helping them to get answer of some of the toughest questions or have an general perspective of other people on your Poll.",
          link: ""),
      projectCard(
          image: 'assets/images/co.png',
          title: "ConJoin",
          des:
              "An all-in-one mobile application for college going people, to get all the survival necessity on a single platform. Be it bulletine board, assignments, event news, attendance tracker. More stuffs are planned for future updates.",
          link: 'https://github.com/surajsisodia/HackBash_Team_MARCOS'),
      projectCard(
          image: 'assets/images/saidiera.png',
          title: "Saidiera Supermercado",
          des:
              "An ecommerce platform, allowing user to browse, purchase and manage their order. This app is accompanied by a rider app.",
          link:
              'https://play.google.com/store/apps/details?id=com.supermacado.saideira'),
      projectCard(
          image: 'assets/images/jag.png',
          title: "JagCab",
          des:
              "A simple and minimalistic mobile application, built upon Flutter, to provide hassle-free cab booking service. Apart from cab service, it also provide option of self-drive cars.",
          link: ""),
    ];

    return Container(
      padding: EdgeInsets.only(top: 30),
      color: darkColor,
      child: Stack(children: [
        Center(
          child: SingleChildScrollView(
            scrollDirection: isSmallScreen ? Axis.horizontal : Axis.horizontal,
            child: isSmallScreen
                ? Row(
                    children: projectWidgets,
                  )
                : Wrap(
                    spacing: b * 0.02,
                    runSpacing: h * 0.05,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: projectWidgets,
                  ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Projects",
            style: GoogleFonts.montserrat(
              color: Colors.white.withOpacity(0.1),
              fontSize: min(80, b * 0.14),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }

  Widget projectCard(
      {@required String? image,
      @required String? title,
      @required String? des,
      @required String? link}) {
    b = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        launchUrlString(link!);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: h * 0.36),
        width: h * 0.36,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.screen,
          gradient: LinearGradient(
              colors: [Colors.white, selectColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              width: h * 0.18,
            ),
            Row(
              children: [
                Expanded(
                  // width: b * 0.17,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        des!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(color: Colors.white.withOpacity(0.6)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).showCursor.zoomInOnHoverSmall;
  }
}
