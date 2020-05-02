import 'package:flutter/material.dart';
import 'package:the_dart_side/src/api_call/album.dart';
import 'package:the_dart_side/src/api_call/albumApiCall.dart';

class AlbumProvider with ChangeNotifier {
  List<Album> _albumList;

  List<Album> get albumList => _albumList;

  void getAlbums() async {
    try {
      _albumList = await AlbumApiCall().getAlbums();
      notifyListeners();
    } catch (error) {
      print(error);
    } finally {
      print('termine');
    }
  }

//  void getAlbums() {
//    AlbumApiCall().getAlbums().then((list) {
//      _albumList = list;
//      notifyListeners();
//    }).catchError((error) {
//      print(error);
//    }).whenComplete(() {
//      print('termine');
//    });
//  }
}
