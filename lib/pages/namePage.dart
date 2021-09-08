import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

class NamePage extends StatelessWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey, I'm",
              style: TextStyle(
                  fontFamily: "Caveat", color: Colors.white, fontSize: 36),
            ),
            Text(
              "Suraj Sisodia",
              style: TextStyle(
                  fontFamily: 'Poppins', color: Colors.white, fontSize: 48),
            )
          ],
        ),
      ),
    );
  }
}
