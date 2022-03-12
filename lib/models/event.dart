// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  Event({
    this.status,
  });

  final int? status;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
