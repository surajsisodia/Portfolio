import 'package:flutter/material.dart';
import 'package:my_portfolio/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final txtStl = TextStyle(fontFamily: "Poppins");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suraj Sisodia',
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                headline1: txtStl,
                headline2: txtStl,
                headline3: txtStl,
                headline4: txtStl,
                headline5: txtStl,
                headline6: txtStl,
                subtitle1: txtStl,
                subtitle2: txtStl,
                bodyText1: txtStl,
                bodyText2: txtStl)),
        home: Home()
        //HomePage(),
        );
  }
}
