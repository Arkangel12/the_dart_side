import 'package:flutter/material.dart';

class FractionallySizedBoxExample extends StatefulWidget {
  @override
  _FractionallySizedBoxExampleState createState() =>
      _FractionallySizedBoxExampleState();
}

class _FractionallySizedBoxExampleState
    extends State<FractionallySizedBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox Example'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              heightFactor: .4,
            ),
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: .7,
              child: FittedBox(child: FlutterLogo()),
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: .15,
            ),
          ),
          FlutterLogo(),
          SizedBox(height: 20,),
          FlutterLogo(),
        ],
      ),
    );
  }
}
