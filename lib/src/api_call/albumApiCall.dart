import 'package:http/http.dart' as http;
import 'package:the_dart_side/src/api_call/album.dart';

abstract class AlbumBase {
  Future<List<Album>> getAlbums();
}

class AlbumApiCall with AlbumBase {
  @override
  Future<List<Album>> getAlbums() async {
    var response = await http.get('http://jsonplaceholder.typicode.com/photos');
//    print(response.statusCode);
    return albumFromJson(response.body);
  }
}
