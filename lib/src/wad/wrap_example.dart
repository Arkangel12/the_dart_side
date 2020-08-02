import 'package:flutter/material.dart';

class WrapExample extends StatefulWidget {
  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Example'),
      ),
      body: SafeArea(
        child: Wrap(
          runSpacing: 6.0,
          spacing: 12.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 75),
            FlutterLogo(size: 150),
            FlutterLogo(size: 55),
            FlutterLogo(size: 100),
            FlutterLogo(size: 75),
            FlutterLogo(size: 75),
            FlutterLogo(size: 100),
            FlutterLogo(size: 75),
            FlutterLogo(size: 75),
            FlutterLogo(size: 100),
            FlutterLogo(size: 75),
            FlutterLogo(size: 75),
            FlutterLogo(size: 75),
            FlutterLogo(size: 75),
          ],
        ),
      ),
    );
  }
}
