import 'package:flutter/material.dart';
import 'package:green_points/Screens/Calculate.dart';

class Scan extends StatelessWidget {
  String id;
  String points;
  String status;
  String redeem;
  Scan(
    this.status,
    this.id,
    this.points,
    {this.redeem}
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
        Positioned(
            left: 10,
            top: 10,
            child: Container(
              child: Text(''),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 20,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Color(0xFF176F17)),
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
            )),
        Positioned(
          left: 100,
          top: 10,
          child: Container(
              width: MediaQuery.of(context).size.width - 200,
              height: MediaQuery.of(context).size.height - 20,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 4, color: Colors.white),
                    bottom: BorderSide(width: 4, color: Colors.white)),
              )),
        ),
        
        Positioned(
            left: 10,
            top: 100,
            child: Container(
              child: Text(''),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 4, color: Colors.white),
                    right: BorderSide(width: 4, color: Colors.white)),
              ),
            )),
         Positioned(child:Center(
           child: Container(
             child: Image.asset(
                 "assets/images/Logo.png",
                 color: Color.fromRGBO(255, 255, 255, 0.5),
                 colorBlendMode: BlendMode.modulate,
             width: 200.0),
           ),
         )
         ),
         Positioned(
           child: Center(
               child: Text(
                 'place phone on the pad ',
                 textDirection: TextDirection.rtl,
                 textScaleFactor: 1.9,
                 textAlign: TextAlign.center,
                 style: TextStyle(color: Color(0xFF176F17)),   //#176F17
               )),
         ),
         checkCalculate(status, id, points, redeem)
           
       
      ]),
    );
  }
}


checkCalculate(String status,String id,String points,String redeem){
  if(redeem != null){
    return  Claculate(status,id,int.parse(points),redeem: int.parse(redeem),);
  }
  else if(redeem == null){
    return  Claculate(status,id,int.parse(points));
  }
}