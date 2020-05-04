import 'dart:math';
import 'package:flutter/material.dart';

class MyProviderNotifications extends ChangeNotifier {
  int notifications;

  void loadNotifications() async {
    notifications = null;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    notifications = random.nextInt(80);
    notifyListeners();
  }
}
