import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:the_dart_side/src/firestore/user.dart';

class MyLogic {
  ValueNotifier<List<User>> users = ValueNotifier(null);

  void getUsers() async {
    final snapshot = await Firestore.instance.collection('users').getDocuments();
    users.value = snapshot.documents.map((item) {
      final id = item.documentID;
      final data = item.data;
      data['id'] = id;
      return User.fromMap(data);
    }).toList();
    print("users: ${users.value.length}");
  }
}
