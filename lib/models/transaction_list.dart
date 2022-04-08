// To parse this JSON data, do
//
//     final transactionData = transactionDataFromJson(jsonString);

import 'dart:convert';

List<TransactionData> transactionDataFromJson(String str) => List<TransactionData>.from(json.decode(str).map((x) => TransactionData.fromJson(x)));

String transactionDataToJson(List<TransactionData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionData {
  TransactionData({
    required this.id,
    required this.type,
    required this.status,
    required this.value,
    required this.date,
    required this.user,
  });

  String id;
  String type;
  String status;
  String value;
  DateTime date;
  User user;

  factory TransactionData.fromJson(Map<String, dynamic> json) => TransactionData(
    id: json["id"],
    type: json["type"],
    status: json["status"],
    value: json["value"],
    date: DateTime.parse(json["date"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "status": status,
    "value": value,
    "date": date.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.username,
    required this.fullName,
    required this.imageUrl,
  });

  String username;
  String fullName;
  String imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    fullName: json["full_name"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "full_name": fullName,
    "image_url": imageUrl,
  };
}
