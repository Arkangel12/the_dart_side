import 'package:flutter/material.dart';
import 'package:the_dart_side/src/screens/myHomePage.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Dart Side',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'The Dart Side'),
    );
  }
}