import 'package:flutter/material.dart';

import 'episode3/episode3_page.dart';

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
                child: Text("Episode III: Appbar Personalizada"),
                onPressed: () => _openNewPage(context, Episode3Page()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
