import 'package:flutter/material.dart';
import 'package:green_points/Models/History.dart';
import 'package:green_points/Screens/HomePage.dart';
import 'Models/Material.dart';
import 'Models/Users.dart';
import 'Models/items.dart';
import 'Models/shops.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchFriends(String id) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/get_friends.php";
  var map = Map<String, dynamic>();
  map['id'] = id;
  final response = await http.post(url,body: map);
  return usersFromJson(response.body);
}

Future<List<Item>> getitems(String condition) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/get_item.php";
  var map = Map<String, dynamic>();
  map['condition'] = condition;
  final response = await http.post(url,body: map);
  return itemFromJson(response.body);
}

Future<List<Shops>> getshops(String type) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/get_shops.php";
  var map = Map<String, dynamic>();
  map['type'] = type;
  final response = await http.post(url,body: map);
  return shopsFromJson(response.body);
}

Future<List<Users>> searchFriend(String condition) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/search.php";
  var map = Map<String, dynamic>();
  map['condition'] = condition;
  final response = await http.post(url,body: map);
  return usersFromJson(response.body);
}

Future<List<Materials>> getMaterial() async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/Material/get_material.php";
  final response = await http.get(url);
  print(response.body);
  return materialFromJson(response.body);
}

updatematerial(String id,String points,String addedpoints, BuildContext context) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/Material/update.php";
  var map = Map<String, dynamic>();
  map['id'] = id;
  map['points'] = points;
  final response = await http.post(url,body: map);
  print(response.body);
  if( response.body == '1'){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        content: Text('$addedpoints'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(id,points)));
          }, child: Text('close'))
        ],
      );
    }
    );
  }

}

addFriend(String friendId, String userId, BuildContext context) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/add_Friend.php";
  var map = Map<String, dynamic>();
  map['user_id'] = userId;
  map['friend_id'] = friendId;
  final response = await http.post(url,body: map);
    if(response.body == '1'){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('Friend Added'),
        );
      }
      );
  }
  else{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('Failed'),
        );
      }
      );   
  }
}




Future<List<Users>> allusersAuth()async { 
  var response = await http.get('https://greenpoints-gp2020.000webhostapp.com/leaderShip.php');
  return usersFromJson(response.body);
}

Future<List<History>> mypoint({String userid}) async{
  await Future.delayed(Duration(seconds: 1));
  var map = new Map<String, String>();
  map['userid'] = userid; 

  var response = await http.post('https://greenpoints-gp2020.000webhostapp.com/history.php', body: map);
  return historyFromMap(response.body);
}


login(String username,String password, BuildContext context) async {
  final response =
      await http.post("https://greenpoints-gp2020.000webhostapp.com/login.php", body: {
    "id": username,
    "password": password,
  });
  if (response.body == '[]') {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Warning!!",
            style: TextStyle(),
          ),
          content:
              new Text("username or password incorrect, please try again"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    if (response.body != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username,"")));
        return username;
    }
  }
}



getuser(String id) async{
  String url = "https://greenpoints-gp2020.000webhostapp.com/get_user.php";
  var map = Map<String, dynamic>();
  map['id'] = id;
  final response = await http.post(url,body: map);
  print(response.body);
  return usersFromJson(response.body);
  }
