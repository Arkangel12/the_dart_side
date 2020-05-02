import 'package:flutter/material.dart';
import 'package:the_dart_side/src/hackerclub/hackerClub.dart';

//import 'package:the_dart_side/src/animations2/implicitAnimations.dart';
//import 'package:the_dart_side/src/episode7/episode7_page.dart';
import 'package:the_dart_side/src/supernova/supernova_test.dart';

//import 'episode3/episode3_page.dart';
//import 'episode8/episode8_page.dart';

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
      theme: ThemeData.light(),
      home: MenuPage(),
    );
  }
}

class Cosa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosa'),
      ),
      body: Container(),
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
              Image.asset('assets/images/dash_vader_white.png', height: 200),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("Hola HackerClub"),
                onPressed: () => _openNewPage(
                  context,
                  HackerClub(),
                ),
              ),
//              RaisedButton(
//                child: Text("Appbar Personalizada"),
//                onPressed: () => _openNewPage(context, Episode3Page()),
//              ),
//              RaisedButton(
//                child: Text("Responsive"),
//                onPressed: () => _openNewPage(context, Episode7Page()),
//              ),
//              RaisedButton(
//                child: Text("Episode VIII: Multilayout"),
//                onPressed: () => _openNewPage(context, Episode8Page()),
//              ),s
//              RaisedButton(
//                child: Text("Animaciones Implicitas"),
////                onPressed: () => _openNewPage(context, ImplicitAnimations()),
//              ),
//              RaisedButton(
//                child: Text("Animaciones Implicitas"),
////                onPressed: () => _openNewPage(context, ImplicitAnimations()),
//              ),
              RaisedButton(
                child: Text("Supernova"),
                onPressed: () => _openNewPage(
                  context,
                  SupernovaTest(),
                ),
              ),
//              RaisedButton(
//                child: Text("Multilayout"),
//                onPressed: () => _openNewPage(
//                  context,
//                  Episode8Page(),
//                ),
//              ),
//              RaisedButton(
//                child: Text("Animations"),
//                onPressed: () => _openNewPage(
//                  context,
//                  MainAnimations(),
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
