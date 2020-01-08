import 'package:flutter/material.dart';
import 'package:the_dart_side/src/animations/implicit/implicit_animations.dart';
import 'package:the_dart_side/src/animations/transition/transition_animations.dart';

class MainAnimations extends StatelessWidget {
  _openNewPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                child: Text("Implicit"),
                onPressed: () => _openNewPage(context, ImplicitAnimations()),
              ),
              RaisedButton(
                child: Text("Transition"),
                onPressed: () => _openNewPage(context, TransitionAnimations()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
