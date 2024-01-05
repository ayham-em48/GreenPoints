import 'package:flutter/material.dart';

import '../DataBase-API.dart';

String id = '';


class Login extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String msg = '';

  // ignore: missing_return
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  width: 200.0,
                  height: 200.0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF176F17))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF176F17))),
                            hintText: 'username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF176F17),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  //margin: EdgeInsets.only( top: 20.0 ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF176F17)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF176F17))),
                            hintText: 'password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF176F17),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Container(
                              child: Material(
                                color: Color(0xFF176F17),
                                borderRadius: BorderRadius.circular(10.0),
                                child: Center(
                                  child: FlatButton(
                                    child: Text('Log in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      login(usernameController.text,passwordController.text,context);
                                    },
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Text(msg,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
