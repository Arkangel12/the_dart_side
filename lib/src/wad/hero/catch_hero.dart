import 'package:flutter/material.dart';

class CatchHero extends StatelessWidget {
  final String name;

  const CatchHero({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catch Hero'),),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2,),
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/dash_vader_white.png',
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
