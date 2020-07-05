import 'package:flutter/material.dart';
import 'package:the_dart_side/src/wad/hero/catch_hero.dart';

class HeroExample extends StatefulWidget {
  @override
  _HeroExampleState createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Example'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 20),
          itemCount: 10,
          itemBuilder: (_, index) => ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CatchHero(
                  id: index,
                  name: 'Dash Vader',
                ),
              ),
            ),
            leading: Container(
              color: Colors.white,
              child: Hero(
                tag: 'tag$index',
                child: Image.asset(
                  'assets/images/dash_vader_white.png',
                ),
              ),
            ),
            title: Text('Dash Vader $index'),
          ),
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
