import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilterExample extends StatefulWidget {
  @override
  _BackDropFilterExampleState createState() => _BackDropFilterExampleState();
}

class _BackDropFilterExampleState extends State<BackDropFilterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackDrop Filter Example'),
      ),
      /*  body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Text('0' * 10000),
            Center(
              child: ClipRect(
                // <-- clips to the 200x200 [Container] below
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    height: 200.0,
                    child: Text('Hello World'),
                  ),
                ),
              ),
            ),
          ],
        )*/
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/stars_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(.1),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset('assets/images/dash_vader_white.png'),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Dash Vader',
              ),
            ),
          )
        ],
      ),
    );
  }
}
