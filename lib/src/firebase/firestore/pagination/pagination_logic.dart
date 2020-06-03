import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/firestore/pagination_firestore_impl.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/memory/pagination_memory_impl.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/pagination_repository.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/photo.dart';

class PaginationLogic extends ChangeNotifier {
  List<Photo> items;
  bool loading = false;
  final PaginationRepository paginationRepository = PaginationFirestoreImpl();

  void loadData(int from, int limit) async {
    loading = true;
    notifyListeners();

    final result = await paginationRepository.getPhotos(from: from, limit: limit);
    if (items == null) {
      items = [];
    }
    items.addAll(result);

    loading = false;
    notifyListeners();
  }
}
