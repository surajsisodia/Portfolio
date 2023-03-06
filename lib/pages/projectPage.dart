import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: darkColor,
      child: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: b * 0.02,
              runSpacing: h * 0.05,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                projectCard(
                    image: 'assets/images/glowcal.png',
                    title: "GlowCal",
                    des:
                        "Sample Sample Sample Sample Sample Sample Sample Sample Sample ",
                    link:
                        'https://github.com/surajsisodia/GlowCal-Flutter-GDSC-2021'),
                projectCard(
                    image: 'assets/images/askthrifty.png',
                    title: "AskThrifty",
                    des:
                        "Sample Sample Sample Sample Sample Sample Sample Sample Sample ",
                    link: "www.google.com"),
                projectCard(
                    image: 'assets/images/co.png',
                    title: "ConJoin",
                    des:
                        "Sample Sample Sample Sample Sample Sample Sample Sample Sample ",
                    link:
                        'https://github.com/surajsisodia/HackBash_Team_MARCOS'),
                projectCard(
                    image: 'assets/images/saidiera.png',
                    title: "Saidiera Supermercado",
                    des:
                        "Sample Sample Sample Sample Sample Sample Sample Sample Sample ",
                    link:
                        'https://play.google.com/store/apps/details?id=com.supermacado.saideira'),
                projectCard(
                    image: 'assets/images/jag.png',
                    title: "JagCab",
                    des:
                        "Sample Sample Sample Sample Sample Sample Sample Sample Sample ",
                    link: "www.google.com"),
              ],
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
        launch(link!);
      },
      child: Card(
        color: Colors.transparent,
        shadowColor: selectColor,
        elevation: 0,
        child: Container(
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
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).showCursor.zoomInOnHoverSmall;
  }
}
