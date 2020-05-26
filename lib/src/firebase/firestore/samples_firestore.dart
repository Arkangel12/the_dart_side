import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/pagination_view.dart';
import 'sample1/sample1_firestore.dart';
import 'sample2/sample2_firestore.dart';

class SamplesFirestore extends StatefulWidget {
  @override
  _SamplesFirestoreState createState() => _SamplesFirestoreState();
}

class _SamplesFirestoreState extends State<SamplesFirestore> {
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
                  child: Text("Sample1 Firestore CRUD - no realtime"),
                  onPressed: () => _openNewPage(
                    context,
                    Sample1Firestore(),
                  ),
                ),
                RaisedButton(
                  child: Text("Sample2 Firestore CRUD - realtime"),
                  onPressed: () => _openNewPage(
                    context,
                    Sample2Firestore(),
                  ),
                ),
                RaisedButton(
                  child: Text("Sample3 Firestore Pagination"),
                  onPressed: () => _openNewPage(
                    context,
                    PaginationView(),
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
