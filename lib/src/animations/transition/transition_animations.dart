import 'package:flutter/material.dart';

class TransitionAnimations extends StatefulWidget {
  @override
  _TransitionAnimationsState createState() => _TransitionAnimationsState();
}

class _TransitionAnimationsState extends State<TransitionAnimations> {
  double squareSize = 80;
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transition Animations",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                circular = !circular;
              });
            },
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.jpeg",
            fit: BoxFit.cover,
          ),
          TweenAnimationBuilder<double>(
            tween: circular
                ? Tween(begin: 0.0, end: 1.0)
                : Tween(begin: 10, end: 0.0),
            duration: const Duration(seconds: 3),
            builder: (context, value, widget) {
              final alignment = Alignment.lerp(
                  Alignment.topLeft, Alignment.bottomRight, value);
              return Align(
                alignment: alignment,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  decoration: BoxDecoration(
                    color: circular ? Colors.red : Colors.blue,
                    borderRadius:
                        circular ? BorderRadius.circular(squareSize / 2) : null,
                  ),
                  height: squareSize,
                  width: squareSize,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
