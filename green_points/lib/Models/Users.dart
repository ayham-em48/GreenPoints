import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromMap(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Users {
    String id;
    String password;
    String name;
    String image;
    String points;
    DateTime bdate;
    String phonenumber;
    String type;

    Users({
        this.id,
        this.password,
        this.name,
        this.image,
        this.points,
        this.bdate,
        this.phonenumber,
        this.type,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        id: json["id"],
        password: json["password"],
        name: json["name"],
        image: json["image"],
        points: json["points"],
        bdate: DateTime.parse(json["bdate"]),
        phonenumber: json["phonenumber"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "password": password,
        "name": name,
        "image": image,
        "points": points,
        "bdate": "${bdate.year.toString().padLeft(4, '0')}-${bdate.month.toString().padLeft(2, '0')}-${bdate.day.toString().padLeft(2, '0')}",
        "phonenumber": phonenumber,
        "type": type,
    };
}
