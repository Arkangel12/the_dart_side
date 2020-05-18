import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firestore/sample1/debouncer.dart';
import 'package:the_dart_side/src/firestore/user.dart';

class MyDetailLogic {
  MyDetailLogic(this.user);

  final User user;

  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  final debouncer = Debouncer();

  void init() {
    if (user != null) {
      textControllerName.text = user.name;
      textControllerEmail.text = user.email;
      valid.value = true;
    }
  }

  void save() async {
    final name = textControllerName.text.trim();
    final email = textControllerEmail.text.trim().toLowerCase();

    final localUser = User(name: name, email: email);
    final ref = Firestore.instance.collection('users');
    if (user != null) {
      ref.document(user.id).updateData(
            localUser.toJson(),
          );
    } else {
      ref.add(
        localUser.toJson(),
      );
    }
  }

  void delete() {
    Firestore.instance.collection('users').document(user.id).delete();
  }

  void onEmailChanged(String val) {
    debouncer.run(() async {
      final email = val.trim().toLowerCase();
      valid.value = null;
      if (email.isNotEmpty) {
        final query = Firestore.instance
            .collection('users')
            .where(
              'email',
              isEqualTo: email,
            )
            .limit(1);

        final list = await query.getDocuments();
        if (user != null) {
          if (list.documents.isNotEmpty) {
            final docID = list.documents.first.documentID;
            valid.value = docID == user.id;
          }
        } else {
          valid.value = !(list.documents.length > 0);
        }
      } else {
        valid.value = false;
      }
    });
  }
}
