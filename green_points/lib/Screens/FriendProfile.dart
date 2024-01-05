import 'package:flutter/material.dart';
import 'package:green_points/Models/History.dart';

import '../DataBase-API.dart';

class FriendProfile extends StatefulWidget {
  //Mprofile({this.id});

  // final String id;

  String userimage;
  String username;
  String usertotalpoint;
  String userid;

  FriendProfile(
      {Key key,
      this.userimage,
      this.username,
      this.usertotalpoint,
      this.userid})
      : super(key: key);

  @override
  _FriendProfile createState() => _FriendProfile(
      userFName: username,
      userid: userid,
      userImage: userimage,
      userTotalPoint: usertotalpoint);
}

class _FriendProfile extends State<FriendProfile> {
  String userImage;
  String userFName;
  String userLName;
  String userTotalPoint;
  String userid;
  _FriendProfile(
      {this.userid,
      this.userTotalPoint,
      this.userLName,
      this.userFName,
      this.userImage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userFName),
        backgroundColor: Color(0xFF176F17),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18, left: 18, bottom: 4, top: 10),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                //image: NetworkImage(userImage)
                                image: NetworkImage(userImage))
                            //  Image.network(snapshot.data.allpoints[index].passport)
                            ),
                      ),
                    ),
                    Text(userFName,
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF176F17),
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$userTotalPoint",
                            style: TextStyle(
                                color: Color(0xff6b932f), fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                width: 35,
                                height: 35,
                                child: Image.asset('assets/images/Logo.png')),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  // height:MediaQuery.of(context).size.height ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color((0xFF176F17)), width: 3)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("ACTIVITIES",
                              style: TextStyle(
                                  color: Color(0xFF176F17),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        FutureBuilder<List<History>>(
                            future: mypoint(
                                userid:
                                    userid), // a previously-obtained Future<String> or null
                            builder: (BuildContext context,
                                AsyncSnapshot<List<History>> snapshot) {
                              return GridView(
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(
                                  left: 18,
                                  right: 18,
                                ),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                    (snapshot.hasData
                                        ? snapshot.data.length
                                        : 0), (index) {
                                  List<Widget> children;
                                  if (snapshot.hasData) {
                                    History history = snapshot.data[index];
                                    children = <Widget>[
                                      Container(
                                          width: 150,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF176F17),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Color((0xFF176F17)),
                                                  width: 3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.white,
                                              ),
                                              Center(
                                                  child: Text(
                                                "${history.addedPoint}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              )),
                                            ],
                                          ))
                                    ];
                                  } else {
                                    children = <Widget>[
                                      SizedBox(
                                        child: CircularProgressIndicator(),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ];
                                  }

                                  return Column(
                                    children: children,
                                  );
                                }),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 6.0,
                                  crossAxisSpacing: 15.0,
                                  childAspectRatio: 0.8,
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
