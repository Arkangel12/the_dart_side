import 'package:flutter/material.dart';

class MyProviderList extends ChangeNotifier {
  List<String> horizontalList;

  void loadHorizontalData() async {
    await Future.delayed(const Duration(seconds: 3));
    horizontalList =
        List.generate(20, (index) => "https://picsum.photos/id/$index/200/300");
    notifyListeners();
  }
}
