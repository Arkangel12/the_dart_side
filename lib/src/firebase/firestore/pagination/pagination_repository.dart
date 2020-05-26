import 'package:the_dart_side/src/firebase/firestore/pagination/photo.dart';

abstract class PaginationRepository {
  Future<List<Photo>> getPhotos({int from, int limit});
}
