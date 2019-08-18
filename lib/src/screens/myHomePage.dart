import 'package:flutter/material.dart';
import 'package:the_dart_side/src/components/myHeader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: 'Starjout'),),
      ),
//      appBar: MyHeader(
//        title: Text(widget.title, style: TextStyle(fontFamily: 'Starjedi'),)
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ejemplo básico de counter: ',
              style: TextStyle(fontFamily: 'Starjedi'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(fontFamily: 'Starjhol'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
