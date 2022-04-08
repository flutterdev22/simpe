// To parse this JSON data, do
//
//     final paymentCardList = paymentCardListFromJson(jsonString);

import 'dart:convert';

List<PaymentCardList> paymentCardListFromJson(String str) => List<PaymentCardList>.from(json.decode(str).map((x) => PaymentCardList.fromJson(x)));

String paymentCardListToJson(List<PaymentCardList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentCardList {
  PaymentCardList({
    required this.id,
    required this.type,
    required this.brandName,
    required this.endNumbers,
  });

  String id;
  String type;
  String brandName;
  String endNumbers;

  factory PaymentCardList.fromJson(Map<String, dynamic> json) => PaymentCardList(
    id: json["id"],
    type: json["type"],
    brandName: json["brand_name"],
    endNumbers: json["end_numbers"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "brand_name": brandName,
    "end_numbers": endNumbers,
  };
}
