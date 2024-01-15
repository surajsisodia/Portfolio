import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';

class WorkExPage extends StatefulWidget {
  const WorkExPage({super.key});

  @override
  State<WorkExPage> createState() => _WorkExPageState();
}

class _WorkExPageState extends State<WorkExPage> {
  PageController scrollController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final b = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return ResponsiveWidget(
      largeScreen: Container(
        color: darkColor,
        child: Stack(
          children: [
            PageView(
              controller: scrollController,
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                oracleWorkEx(context, b, h),
                // oracleWorkEx(context, b, h)
              ],
            ),
            //navigateButton(true),
            //navigateButton(false),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("Work Ex",
                  style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(0.1),
                    fontSize: min(80, b * 0.14),
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
      smallScreen: oracleWorkExSmall(h, b),
    );
  }

  Stack oracleWorkExSmall(double h, double b) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: h * 0.2),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Colors.black,
                    Colors.black54,
                    Colors.transparent
                  ],
                      stops: [
                    0,
                    0.2,
                    0.8
                  ])
                  .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              'assets/images/me_sleeping.jpeg',
              width: b,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
                left: b * 0.07, right: b * 0.07, bottom: b * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/oracle_logo.png',
                ),
                SizedBox(
                  height: h * 0.05
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Application Developer",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.white38,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3)),
                    Text("Jun 2023 - Present",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white38,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(
                  height: 3
                ),
                Text(
                  "Worked and fixed bugs in Oracle's one of the famous Fusion product, i.e. SCM(Supply Chain Management) and with the finest team of Cost Management. Understood and worked with core business logic. Got chance to work upon Oracle DB, PL/SQL and Oracle's Application Development Framework(ADF).",
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  oracleWorkEx(BuildContext context, double b, double h) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: b * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/oracle_logo.png',
                  height: h * 0.3,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Application Developer",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white38,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8)),
                    Text("Jun 2023 - Present",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white38,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Worked and fixed bugs in Oracle's one of the famous Fusion product, i.e. SCM(Supply Chain Management) and with the finest team of Cost Management. Understood and worked with core business logic. Got chance to work upon Oracle DB, PL/SQL and Oracle's Application Development Framework(ADF).",
                  style: GoogleFonts.poppins(),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        end: Alignment.centerLeft,
                        begin: Alignment.centerRight,
                        colors: [
                      Colors.black,
                      Colors.black54,
                      Colors.transparent
                    ],
                        stops: [
                      0,
                      0.5,
                      0.9
                    ])
                    .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/me_sleeping.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector navigateButton(bool isLeft) {
    return GestureDetector(
      onTap: () {
//           if((scrollController.page??0) >= 0  && (scrollController.page??0) < 1 && isLeft )
//             return;

//           // if((scrollController.page??0) >= 0  && (scrollController.page??0) < 1 && !isLeft )
//           //   return;

//             // scrollController.
// //
//           if(!isLeft)
//           scrollController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//           else
//           scrollController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      },
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.only(
                topRight: isLeft ? Radius.circular(15) : Radius.zero,
                bottomRight: isLeft ? Radius.circular(15) : Radius.zero,
                topLeft: isLeft ? Radius.zero : Radius.circular(15),
                bottomLeft: isLeft ? Radius.zero : Radius.circular(15)),
          ),
          height: 80,
          width: 50,
          child: Icon(isLeft ? Icons.chevron_left : Icons.chevron_right),
        ),
      ),
    );
  }
}
