import 'dart:convert';

List<History> historyFromMap(String str) => List<History>.from(json.decode(str).map((x) => History.fromMap(x)));

String historyToMap(List<History> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class History {
    History({
        this.userId,
        this.addedPoint,
        this.date,
    });

    String userId;
    String addedPoint;
    DateTime date;

    factory History.fromMap(Map<String, dynamic> json) => History(
        userId: json["user_id"],
        addedPoint: json["added_point"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "added_point": addedPoint,
        "date": date.toIso8601String(),
    };
}
