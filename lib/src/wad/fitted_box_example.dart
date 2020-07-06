import 'package:flutter/material.dart';

class FittedBoxExample extends StatefulWidget {
  @override
  _FittedBoxExampleState createState() => _FittedBoxExampleState();
}

class _FittedBoxExampleState extends State<FittedBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox Example'),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Image.asset('assets/images/dash_vader_white.png'),
              ),
            ),
            Expanded(
              child: FittedBox(
                child: Text(
                  'Dash Vader',
                ),
              ),
            ),
//            Expanded(
//              child: Container(color: Colors.red,),
//            )
          ],
        ),
      ),
    );
  }
}
