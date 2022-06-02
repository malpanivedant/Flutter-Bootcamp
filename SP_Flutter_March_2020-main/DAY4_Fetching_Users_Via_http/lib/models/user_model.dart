import 'package:flutter/foundation.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  UserModel(
      {@required this.id,
      @required this.name,
      @required this.username,
      @required this.email,
      @required this.website});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        id: jsonData["id"],
        name: jsonData["name"],
        username: jsonData["username"],
        email: jsonData["email"],
        website: jsonData["website"]);
  }
}
