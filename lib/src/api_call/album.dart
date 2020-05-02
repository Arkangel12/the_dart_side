// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

List<Album> albumFromJson(String str) => List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
