import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/utils/colors.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  double sideLinesWidth = 0;
  double heyOpacity = 0, nameOpacity = 0;

  @override
  void initState() {
    super.initState();

    startAnimation();
  }

  startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      heyOpacity = 1;
      setState(() {});
    });

    await Future.delayed(Duration(milliseconds: 1000), () {
      nameOpacity = 1;
      setState(() {});
    });

    await Future.delayed(Duration(milliseconds: 1000), () {
      sideLinesWidth = 150;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AnimatedOpacity(
              opacity: heyOpacity,
              duration: Duration(milliseconds: 1000),
              child: Text(
                "Hey, I'm",
                style: TextStyle(
                    fontFamily: "Caveat", color: Colors.white, fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  width: sideLinesWidth,
                  height: 3,
                  color: Colors.white,
                  curve: Curves.easeOut,
                ),
                SizedBox(
                  width: 20,
                ),
                AnimatedOpacity(
                  opacity: nameOpacity,
                  duration: Duration(milliseconds: 1500),
                  child: Text(
                    "Suraj Sisodia",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 48),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  width: sideLinesWidth,
                  height: 3,
                  color: Colors.white,
                  curve: Curves.easeOut,
                ),
              ],
            ),
            Spacer(),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Image.asset(
            //     'assets/anim/swipeAnim.gif',
            //     width: 100,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
