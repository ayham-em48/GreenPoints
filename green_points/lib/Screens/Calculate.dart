import 'package:flutter/material.dart';
import 'package:green_points/Models/Material.dart';

import '../DataBase-API.dart';

class Claculate extends StatelessWidget{
  int weight;
  int type;
  int points;
  String id;
  String status;
  int redeem;

  Claculate(
    this.status,
    this.id,
    this.points,
    {this.redeem}
  );
    Widget build(BuildContext context){
      return  FutureBuilder(
            future: getMaterial(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                Materials material = snapshot.data[0];
                weight = int.parse('${material.weight}');
                type = int.parse('${material.type}');
                /*
                IN JOD
                Paper = 0.00078 JOD/gram
                Aluminum = 0.00086 JOD/gram
                Glass = 0.00078 JOD/gram
                -----------------------------
                Avg = 0.002 JOD/gram == 1 point
                ----------------------------------
                */
                if(status=="0"){
                  if(type != 0){
                    points += weight;
                    updatematerial(id,points.toString(),weight.toString(), context);
                    
                  }
                  else{
                    return AlertDialog(
                      content: Container(
                        child: Text("Not Recyclable")
                      ),
                    );
                  }
                }
                else if(status=="1"){
                  points-=redeem;
                   updatematerial(id,points.toString(),redeem.toString(), context);

                }
              }
              else{
                return CircularProgressIndicator();
              }
              return Container();
            }
            
      );
    }
}

