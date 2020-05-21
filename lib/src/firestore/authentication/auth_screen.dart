import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firestore/authentication/login_screen.dart';
import 'package:the_dart_side/src/firestore/authentication/register_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => null, //TODO add logout function
          ),
        ],
      ),
      body: PageView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              color: Colors.red[400],
              onPressed: () {
                //TODO add anonymous function
              },
              child: Text('Anonymous'),
            ),
          ),
          RegisterScreen(),
          LoginScreen(),
        ],
      ),
    );
  }
}
