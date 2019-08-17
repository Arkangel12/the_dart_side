import 'package:flutter/material.dart';
import 'package:the_dart_side/myHeader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: MyHeader(leftIcon: Text('Adopta un Dash'), title: 'Hola',),
          body: Center(
            child: Text('The Dart Side'),
          ),
        ),
      ),
    );
  }
}
