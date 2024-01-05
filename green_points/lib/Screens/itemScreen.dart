import 'package:flutter/material.dart';
import 'package:green_points/Design/Object.dart';
import 'package:green_points/Models/items.dart';
import 'Scan.dart';

import '../DataBase-API.dart';


class ItemScreen extends StatelessWidget {
  
  String shopname;
  String id;
  String points;
  ItemScreen(this.id,this.shopname,this.points);
  @override
  Widget build(BuildContext context){
    return Scaffold(
   appBar: AppBar(title: Text('$shopname'),),
  body:Container(
    child: FutureBuilder(
      future: getitems('$shopname'),
      builder: (context, snapshot){
        if (snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,index){
            Item items =snapshot.data[index];
            return RecurrentObject(
              name: '${items.itemsname}',
              points: '${items.price}',
              icon: IconData( int.parse(items.icons) ,fontFamily: 'MaterialIcons'),
              moveToPage: Scan("1",id,points,redeem: '${items.price}',),
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