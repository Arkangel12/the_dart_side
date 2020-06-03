import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/pagination_repository.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/photo.dart';

class PaginationFirestoreImpl extends PaginationRepository {
  @override
  Future<List<Photo>> getPhotos({int from, int limit}) async {
    Query myQuery = Firestore.instance.collection('photos').orderBy('position');
    if (from == null) {
      myQuery = myQuery.limit(limit);
    } else {
      myQuery = myQuery.startAfter([from]).limit(limit);
    }

    final result = (await myQuery.getDocuments())
        .documents
        .map(
          (e) => Photo(
            image: e.data['image'],
            position: e.data['position'],
            title: e.data['title'],
          ),
        )
        .toList();
    return result;
  }
}
