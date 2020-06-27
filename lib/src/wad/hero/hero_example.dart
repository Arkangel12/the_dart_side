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
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: 1,
          itemBuilder: (_, index) => ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CatchHero(name: 'Dash Vader',),
              ),
            ),
            leading: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/dash_vader_white.png',
              ),
            ),
            title: Text('Dash Vader'),
          ),
        ),
      ),
    );
  }
}
