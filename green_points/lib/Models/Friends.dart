import 'dart:convert';

List<Friends> friendsFromJson(String str) => List<Friends>.from(json.decode(str).map((x) => Friends.fromMap(x)));

String friendsToJson(List<Friends> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Friends {
    String userid;
    String friendid;

    Friends({
        this.userid,
        this.friendid,
    });

    factory Friends.fromMap(Map<String, dynamic> json) => Friends(
        userid: json["userid"],
        friendid: json["friendid"],
    );

    Map<String, dynamic> toMap() => {
        "userid": userid,
        "friendid": friendid,
    };
}
