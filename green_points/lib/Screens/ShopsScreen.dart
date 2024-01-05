import 'package:flutter/material.dart';
import 'package:green_points/Design/Object.dart';
import 'package:green_points/Models/shops.dart';
import 'itemScreen.dart';

import '../DataBase-API.dart';

class ShopsScreen extends StatelessWidget {
  String type;
  String id;
  String points;
  ShopsScreen(
    this.id,
    this.type,
    this.points
  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
   appBar: AppBar(title: Text('Shops'),),
  body:Container(
    child: FutureBuilder(
      future: getshops(type),
      builder: (context, snapshot){
        if (snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,index){
            Shops shops =snapshot.data[index];
            return RecurrentObject(
              name: '${shops.shopname}',
              //points: '${shops.points}',
              icon: IconData( int.parse(shops.icon) ,fontFamily: 'MaterialIcons'),
              moveToPage: ItemScreen(id,'${shops.shopname}',points),
            );

          },
        );
         }

        return Center(child: CircularProgressIndicator());
     
      }
    ),
  )

  
  
    );
  }
  }