import 'package:flutter/material.dart';
import 'package:the_dart_side/src/animations/main_animations.dart';
import 'package:the_dart_side/src/custom_appbar/episode3_page.dart';
import 'package:the_dart_side/src/multi_layout/episode8_page.dart';
import 'package:the_dart_side/src/responsive/episode7_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  _openNewPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                child: Text("Appbar Personalizada"),
                onPressed: () => _openNewPage(context, Episode3Page()),
              ),
              RaisedButton(
                child: Text("Responsive"),
                onPressed: () => _openNewPage(context, Episode7Page()),
              ),
              RaisedButton(
                child: Text("Multilayout"),
                onPressed: () => _openNewPage(context, Episode8Page()),
              ),
              RaisedButton(
                child: Text("Animations"),
                onPressed: () => _openNewPage(context, MainAnimations()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
