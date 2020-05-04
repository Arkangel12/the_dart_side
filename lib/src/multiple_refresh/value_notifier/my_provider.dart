import 'dart:math';

import 'package:flutter/material.dart';

class MyProvider {
  final ValueNotifier<List<String>> horizontalList = ValueNotifier(null);
  final ValueNotifier<String> imageDetail = ValueNotifier(null);
  final ValueNotifier<int> notifications = ValueNotifier(null);

  void loadData() {
    loadNotifications();
    loadImageDetail();
    loadHorizontalData();
  }

  void loadNotifications() async {
    notifications.value = null;
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    notifications.value = random.nextInt(80);
  }

  void loadHorizontalData() async {
    await Future.delayed(const Duration(seconds: 3));
    horizontalList.value =
        List.generate(20, (index) => "https://picsum.photos/id/$index/200/300");
  }

  void loadImageDetail() async {
    await Future.delayed(const Duration(seconds: 4));
    imageDetail.value = "https://picsum.photos/250/250?grayscale";
  }
}
