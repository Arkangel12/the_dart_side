import 'package:flutter/material.dart';

class CatchHero extends StatelessWidget {
  final String name;
  final int id;

  const CatchHero({Key key, this.name, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$name $id'),),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: Hero(
              tag: 'tag$id',
              child: Image.asset(
                'assets/images/dash_vader_white.png',
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
