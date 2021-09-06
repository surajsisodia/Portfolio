import 'package:flutter/material.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suraj Sisodia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home()
        //HomePage(),
        );
  }
}
