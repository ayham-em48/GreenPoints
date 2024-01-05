import 'package:flutter/material.dart';
import 'package:green_points/Design/Object.dart';
import 'package:green_points/Models/Users.dart';

import '../DataBase-API.dart';

class AddScreen extends StatelessWidget{
  String user_id;
  AddScreen(
    this.user_id
  );
  final myController = TextEditingController();
  String addedUser = "";
  setText(String text){
    addedUser =text;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for a Friend')
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width/1.2,
              child:TextField(
                controller: myController,
                textInputAction: TextInputAction.go,
                onSubmitted: setText(myController.text),
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search Using ID: 201210111",
              ),
            )),
            Container(
              child: getAddedFreind(addedUser,user_id),
            )
            
          ],
        )

      )
    );
  }
}

getAddedFreind(String friendId,String userId){
  if(friendId != "" && friendId != null){
    return FutureBuilder(
      future: searchFriend(friendId),
      builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index){
                Users add = snapshot.data[index];
                return RecurrentObject(
                  name: '${add.name}',
                  imagePath: '${add.image}',
                  button: true,
                  buttonPressed: () {
                    addFriend(friendId, userId, context);
                    },
                );
              },

            );

          }
          return Center(child: CircularProgressIndicator());
      },
    );
  }
  else{
    return Text('');
  }

}

void showAlert(String added, BuildContext context){

}