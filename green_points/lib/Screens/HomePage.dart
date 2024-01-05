import 'package:flutter/material.dart';
import 'package:green_points/DataBase-API.dart';
import 'package:green_points/Design/CircleButton.dart';
import 'package:green_points/Design/section.dart';
import 'package:green_points/Models/Users.dart';
import 'package:green_points/Screens/LeaderShip.dart';
import 'package:green_points/Screens/Login.dart';

import 'EditProfile.dart';
import 'FriendsList.dart';
import 'Scan.dart';
import 'ShopsScreen.dart';


class HomePage extends StatelessWidget {
  List<String> history = List(5);
  String id; 
  String points;
  String type;
  HomePage(this.id,this.points);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
          
          new Positioned(
            top: 60.0,
            left: 10.0,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Color(0xFF176F17),
                    heroTag: 'btn1',
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile(id)));
                    },
                    child: Icon(Icons.edit),
                  ),
                  Container(child: Text(''),),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Icon(Icons.exit_to_app),
                  ),
                ],
              )
          ),

          new Positioned(
            child: Container(
              child: Image.asset("assets/images/Logo.png"),
            ),
            top:  MediaQuery.of(context).size.height/25,
          ),
          
          //Points of user
          Positioned(
            child: Container(
              child:FutureBuilder(
              future: getuser(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Users user = snapshot.data[index];
                      points = '${user.points}';
                      type = '${user.type}';
                      return Text(
                      '$points', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Color(0xFF176F17),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
            )
          ),



          //Scan Button
          new Positioned(
            child: CircleButton(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan("0",id,points)));
                },
                iconData: Icons.wifi,
                color: Color(0xDE176F17),//#176F17 //DE is 87% opacity alpha value
                size: 170.0),
            bottom: 55.0,
          ),

          //History
          Section(
            color: 0xFFFFFFFFF,//#176F17
            bottom: 50.0,
            height: 60.0,
            icon1: Icons.history,
            align: MainAxisAlignment.start,
            iconsColor: Color(0xFF176F17),
            text: history,
          ),


          //toolbar
          Section(
            color: 0xFF176F17,//#176F17
            bottom: 0,
            height: 50.0,
            icon1: Icons.store,
            icon1MoveTo: ShopsScreen(id,type,points),
            icon2: Icons.people,
            icon2MoveTo: FriendsList(id),
            icon3: Icons.equalizer,
            icon3MoveTo: LeaderShip(),
            align: MainAxisAlignment.spaceEvenly,
            iconsColor: Colors.white,
          ),

      ],
    ))
    );
  }
}

