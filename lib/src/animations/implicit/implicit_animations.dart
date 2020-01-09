import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double squareSize = 80;
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Implicit Animations",
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
          Align(
            alignment: circular ? Alignment.topLeft : Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: circular ? Colors.red : Colors.blue,
                borderRadius:
                    circular ? BorderRadius.circular(squareSize / 2) : null,
              ),
              height: squareSize,
              width: squareSize,
            ),
          ),
        ],
      ),
    );
  }
}
