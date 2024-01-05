import 'package:flutter/material.dart';
import 'package:green_points/Design/Object.dart';
import 'package:green_points/Models/Users.dart';

import '../DataBase-API.dart';

class LeaderShip extends StatefulWidget {
  LeaderShip({this.id});
  final String id;

//  Home({Key key}) : super(key: key);
//  @override
  _HomeState createState() => _HomeState();
}

RecurrentObject allObj = RecurrentObject();

class _HomeState extends State<LeaderShip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LeaderShip"),
        backgroundColor: Color(0xFF176F17),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: FutureBuilder(
              future: allusersAuth(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Users users = snapshot.data[index];
                      return RecurrentObject(
                        name: '${users.name}',
                        imagePath: '${users.image}',
                        points: '${users.points}',
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
          ),
    );
  }
}
