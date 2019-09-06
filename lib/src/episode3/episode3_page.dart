import 'package:flutter/material.dart';

import 'myAppbar.dart';

class Episode3Page extends StatefulWidget {
  Episode3Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Episode3PageState createState() => _Episode3PageState();
}

class _Episode3PageState extends State<Episode3Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: MyAppbar(
          title: Text(
            "The Dart Side",
            style: TextStyle(fontFamily: 'Starjout'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ejemplo básico de counter: ',
                style: TextStyle(fontFamily: 'Starjedi'),
              ),
              Text(
                '$_counter',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .apply(fontFamily: 'Starjhol'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
