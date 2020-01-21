import 'package:flutter/material.dart';
//import 'package:the_dart_side/src/animations2/implicitAnimations.dart';
import 'package:the_dart_side/src/episode7/episode7_page.dart';
import 'package:the_dart_side/src/supernova/supernova_test.dart';

import 'episode3/episode3_page.dart';
import 'episode8/episode8_page.dart';

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
                child: Text("Episode III: Appbar Personalizada"),
                onPressed: () => _openNewPage(context, Episode3Page()),
              ),
              RaisedButton(
                child: Text("Episode VII: Responsive"),
                onPressed: () => _openNewPage(context, Episode7Page()),
              ),
              RaisedButton(
                child: Text("Episode VIII: Multilayout"),
                onPressed: () => _openNewPage(context, Episode8Page()),
              ),
              RaisedButton(
                child: Text("Animaciones Implicitas"),
//                onPressed: () => _openNewPage(context, ImplicitAnimations()),
              ),
              RaisedButton(
                child: Text("Animaciones Implicitas"),
//                onPressed: () => _openNewPage(context, ImplicitAnimations()),
              ),
              RaisedButton(
                child: Text("Supernova"),
                onPressed: () => _openNewPage(context, SupernovaTest()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
