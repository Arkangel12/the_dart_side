import 'package:flutter/material.dart';

class Episode7Page extends StatefulWidget {
  @override
  _Episode7PageState createState() => _Episode7PageState();
}

class _Episode7PageState extends State<Episode7Page> {
  double _width;
  double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.green,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.pink,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.orange,
                        ),Container(
                          width: 100,
                          height: 50,
                          color: Colors.red,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.white,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.greenAccent,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.greenAccent,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
