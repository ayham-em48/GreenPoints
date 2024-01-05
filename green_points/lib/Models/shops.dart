import 'dart:convert';

List<Shops> shopsFromJson(String str) => List<Shops>.from(json.decode(str).map((x) => Shops.fromMap(x)));

String shopsToJson(List<Shops> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Shops {
    String shopname;
    String icon;
    String type;

    Shops({
        this.shopname,
        this.icon,
        this.type
    });

    factory Shops.fromMap(Map<String, dynamic> json) => Shops(
        shopname: json["shopname"],
        icon: json["icon"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "shopname": shopname,
        "icon": icon,
        "type": type,
    };
}
