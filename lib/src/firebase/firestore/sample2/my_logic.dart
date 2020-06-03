import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:the_dart_side/src/firebase/firestore/user.dart';

class MyLogic {
  ValueNotifier<List<User>> users = ValueNotifier(null);
  StreamSubscription _streamSubscription;

  void getUsers() {
    _streamSubscription = Firestore.instance.collection('users').snapshots().listen((onData) {
      users.value = onData.documents.map((item) {
        final id = item.documentID;
        final data = item.data;
        data['id'] = id;
        return User.fromMap(data);
      }).toList();
    });
  }

  void cancel() {
    _streamSubscription.cancel();
  }
}
