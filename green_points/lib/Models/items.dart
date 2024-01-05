import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromMap(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Item {
    String shopname;
    String itemsname;
    String icons;
    String price;

    Item({
        this.shopname,
        this.itemsname,
        this.icons,
        this.price,
    });

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        shopname: json["shopname"],
        itemsname: json["itemsname"],
        icons: json["icons"],
        price: json["price"],
    );

    Map<String, dynamic> toMap() => {
        "shopname": shopname,
        "itemsname": itemsname,
        "icons": icons,
        "price": price,
    };
}
