import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/authentication/auth_screen.dart';
import 'package:the_dart_side/src/firebase/firestore/samples_firestore.dart';

class SamplesFirebase extends StatefulWidget {
  @override
  _SamplesFirebaseState createState() => _SamplesFirebaseState();
}

class _SamplesFirebaseState extends State<SamplesFirebase> {
  void _openNewPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("Samples Firestore"),
                  onPressed: () => _openNewPage(
                    context,
                    SamplesFirestore(),
                  ),
                ),
                RaisedButton(
                  child: Text("Sample FirebaseAuth"),
                  onPressed: () => _openNewPage(
                    context,
                    AuthScreen(),
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
