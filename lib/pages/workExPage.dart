import 'package:flutter/material.dart';

class WorkExPage extends StatelessWidget {
  const WorkExPage({super.key});

  @override
  Widget build(BuildContext context) {
    final b = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: b*0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/oracle_logo.png',
                  height: h*0.3,),
                  Text(
                      "Worked and fixed bugs in Oracle's one of the famous Fusion product, i.e. SCM(Supply Chain Management). Understood and worked with core business logic. Got chance to work upon Oracle DB, PL/SQL and Oracle's Application Development Framework(ADF).")
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
                    colors: [Colors.black, Colors.black54, Colors.transparent],
                    stops: [0,0.5, 0.9]
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(h * 0.5),
                  //     bottomLeft: Radius.circular(h*100)),
                  child: Image.asset(
                    'assets/images/me_sleeping.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Image.asset('assets/images/me_sleeping.jpeg',
              // fit: BoxFit.cover,
              // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              //   return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),);
              // },),
            ),
          ),
        ],
      ),
    );
  }
}
