// To parse this JSON data, do
//
//     final searchUser = searchUserFromJson(jsonString);

import 'dart:convert';

List<SearchUser> searchUserFromJson(String str) => List<SearchUser>.from(json.decode(str).map((x) => SearchUser.fromJson(x)));

String searchUserToJson(List<SearchUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchUser {
  SearchUser({
    required this.username,
  });

  String username;

  factory SearchUser.fromJson(Map<String, dynamic> json) => SearchUser(
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}
