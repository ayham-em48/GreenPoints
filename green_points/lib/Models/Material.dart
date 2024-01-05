import 'dart:convert';

List<Materials> materialFromJson(String str) => List<Materials>.from(json.decode(str).map((x) => Materials.fromMap(x)));

String materialToJson(List<Materials> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Materials {
    String type;
    String weight;
    DateTime date;

    Materials({
        this.type,
        this.weight,
        this.date,
    });

    factory Materials.fromMap(Map<String, dynamic> json) => Materials(
        type: json["type"],
        weight: json["weight"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "weight": weight,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
