import 'package:the_dart_side/src/firebase/firestore/pagination/pagination_repository.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/photo.dart';

class PaginationMemoryImpl extends PaginationRepository {
  @override
  Future<List<Photo>> getPhotos({int from, int limit}) async {
    await Future.delayed(const Duration(seconds: 3));
    int indexFrom = from ?? 0;
    return List.generate(
      limit,
      (index) => Photo(
        position: indexFrom + index + 1,
        image: 'https://via.placeholder.com/150/97cfe7',
        title: 'Test sample $index',
      ),
    );
  }
}
