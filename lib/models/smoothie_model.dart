// To parse this JSON data, do
//
//     final smoothie = smoothieFromMap(jsonString);

import 'dart:convert';

Smoothie smoothieFromMap(String str) => Smoothie.fromMap(json.decode(str));

String smoothieToMap(Smoothie data) => json.encode(data.toMap());

class Smoothie {
  Smoothie({
    required this.title,
    required this.method,
    required this.rating,
  });

  String title;
  String method;
  int rating;

  factory Smoothie.fromMap(Map<String, dynamic> json) => Smoothie(
        title: json["title"],
        method: json["method"],
        rating: json["rating"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "method": method,
        "rating": rating,
      };
}
