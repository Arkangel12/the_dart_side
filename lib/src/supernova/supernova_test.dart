import 'package:flutter/material.dart';

class SupernovaTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0,
              0.5,
              1,
            ],
            colors: [
              Color.fromARGB(255, 178, 19, 19),
              Color.fromARGB(255, 181, 49, 49),
              Color.fromARGB(255, 89, 10, 10),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 4,
              child: FractionallySizedBox(
                widthFactor: .6,
                child: Image.asset('assets/images/dash_2.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  "Welcome \nThe Dart Side",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
