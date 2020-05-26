import 'package:meta/meta.dart';

class User {
  final String name;
  final String email;
  final String id;

  User({
    @required this.name,
    @required this.email,
    this.id,
  });

  factory User.fromMap(dynamic data) => User(
        name: data['name'],
        email: data['email'],
        id: data['id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
