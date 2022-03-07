import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/utils/firebase_config.dart';

void main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: fAPIKey,
          appId: fAppId,
          messagingSenderId: fMessagingId,
          projectId: fProjectId));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final txtStl = TextStyle(fontFamily: "Poppins");

  increaseVisitorCounter() {
    FirebaseFirestore.instance
        .collection('stats')
        .doc('visitorCounter')
        .update({"counter": FieldValue.increment(1)});
  }

  @override
  Widget build(BuildContext context) {
    increaseVisitorCounter();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suraj Sisodia',
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
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
