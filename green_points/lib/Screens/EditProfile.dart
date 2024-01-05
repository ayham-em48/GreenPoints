import 'package:flutter/material.dart';
import 'package:green_points/Models/Users.dart';

import '../DataBase-API.dart';

class EditProfile extends StatelessWidget {
  String id;
  EditProfile(
    this.id,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit Profile')),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Save'),
          icon: Icon(Icons.save),
          onPressed: null),
        body: Container(
            child:FutureBuilder(
              future: getuser(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Users user = snapshot.data[index];
                      return Column(
                      children: <Widget>[
                        ClipOval(
                          child: Image.network('${user.image}',
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: '${user.name}',
                            labelText: '${user.name}',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: '${user.phonenumber}',
                            labelText: '${user.phonenumber}',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            hintText: '${user.bdate}',
                            labelText: '${user.bdate}',
                          ),
                        ),
                      ],
                    );
                    },
                  );
                }
                else if(snapshot.hasError)
                print('EEEEEEERRRRRRRRRRRRROOOOOOOOOORRRRRRRRRR');
                return Center(child: CircularProgressIndicator());
              },
            )
            )
        );
  }
}
