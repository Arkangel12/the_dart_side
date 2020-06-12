import 'package:flutter/material.dart';

class AspectRatioExample extends StatefulWidget {
  @override
  _AspectRatioExampleState createState() => _AspectRatioExampleState();
}

class _AspectRatioExampleState extends State<AspectRatioExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aspect Ratio Example'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 21/9, // valor
                  child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/images/dash_vader_white.png'),
                  ),
                ),
              ),
            ),
            Text('Dash Vader'),
          ],
        ),
      ),
    );
  }
}
