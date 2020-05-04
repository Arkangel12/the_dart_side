import 'package:flutter/material.dart';

class MyProviderDetail extends ChangeNotifier {
  String imageDetail;

  void loadImageDetail() async {
    await Future.delayed(const Duration(seconds: 4));
    imageDetail = "https://picsum.photos/250/250?grayscale";
    notifyListeners();
  }
}
