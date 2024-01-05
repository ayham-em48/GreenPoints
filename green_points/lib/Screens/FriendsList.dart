import 'package:flutter/material.dart';
import 'package:green_points/Design/Object.dart';
import 'package:green_points/Models/Users.dart';
import 'package:green_points/Screens/FriendProfile.dart';
import 'AddScreen.dart';

import '../DataBase-API.dart';


class FriendsList extends StatefulWidget {
  String id;
  FriendsList(
    this.id
  );
  ListFriends createState() => ListFriends(id);
}

Future<List> freinds = fetchFriends("");

class ListFriends extends State<FriendsList> {
  String id;
  ListFriends(
    this.id
  );
  void initState() {
    super.initState();
    freinds = fetchFriends(id);
  }

  Future<Null> referesh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      freinds = fetchFriends(id);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Friends'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                iconSize: 40.0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddScreen(id)));
                })
          ],
        ),
        body: RefreshIndicator(
            child: Container(
                child: FutureBuilder(
              future: freinds,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Users friends = snapshot.data[index];
                      return RecurrentObject(
                        name: '${friends.name}',
                        imagePath: '${friends.image}',
                        points: '${friends.points}',
                        moveToPage: FriendProfile(
                          username: '${friends.name}',
                          userimage: '${friends.image}',
                          usertotalpoint: '${friends.points}',
                          userid: '${friends.id}',
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
            onRefresh: referesh));
  }
}
