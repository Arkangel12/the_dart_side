import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dart_side/src/api_call/albumApiCall.dart';
import 'package:the_dart_side/src/api_call/albumProvider.dart';

import 'album.dart';

class AsyncCalls extends StatelessWidget {
//  @override
//  _AsyncCallsState createState() => _AsyncCallsState();
//}
//
//class _AsyncCallsState extends State<AsyncCalls> {
//  List<Album> list;
//
//  @override
//  void initState() {
//    fetchAlbum();
//    super.initState();
//  }
//
//  fetchAlbum() async {
//    list = await AlbumApiCall().getAlbums();
//    setState(() {});
//  }
//
//  fetchAlbum()  {
//    AlbumApiCall().getAlbums().then((response){
//      setState(() {
//        list = response;
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peticiones Asíncronas'),
      ),
//      body: list == null
//          ? Center(
//              child: CircularProgressIndicator(),
//            )
//          : ListView.builder(
//              itemCount: list.length,
//              itemBuilder: (_, index) {
//                return ListTile(
//                  leading: CircleAvatar(
//                    backgroundImage: NetworkImage(list[index].thumbnailUrl),
//                  ),
//                  title: Text(list[index].id.toString()),
//                  subtitle: Text(list[index].title),
//                );
//              },
//            ),
//      body: FutureBuilder<List<Album>>(
//        initialData: [],
//        future: AlbumApiCall().getAlbums(),
//        builder: (_, snapshot) {
//          return ListView.builder(
//            itemCount: snapshot.data.length,
//            itemBuilder: (_, index) {
//              return ListTile(
//                leading: CircleAvatar(
//                  backgroundImage:
//                      NetworkImage(snapshot.data[index].thumbnailUrl),
//                ),
//                title: Text(snapshot.data[index].id.toString()),
//                subtitle: Text(snapshot.data[index].title),
//              );
//            },
//          );
//        },
//      ),
    body: Consumer<AlbumProvider>(
      builder: (_, snapshot, __){
        if( snapshot.albumList == null)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: snapshot.albumList.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                NetworkImage(snapshot.albumList[index].thumbnailUrl),
              ),
              title: Text(snapshot.albumList[index].id.toString()),
              subtitle: Text(snapshot.albumList[index].title),
            );
          },
        );
      },
    ),
    );
  }
}
