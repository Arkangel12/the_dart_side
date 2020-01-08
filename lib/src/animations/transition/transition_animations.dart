import 'package:flutter/material.dart';

class TransitionAnimations extends StatefulWidget {
  @override
  _TransitionAnimationsState createState() => _TransitionAnimationsState();
}

class _TransitionAnimationsState extends State<TransitionAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Implicits Animations",
        ),
      ),
    );
  }
}
