
import 'dart:ui';

import 'package:flutter/material.dart';

class RecurrentObject extends StatelessWidget {

IconData icon;
String imagePath;
String name;
bool button;
String points;
Object moveToPage;
Function() buttonPressed;

RecurrentObject({
  this.icon,
  this.imagePath,
  this.name,
  this.points,
  this.button,
  this.moveToPage,
  this.buttonPressed
});


  @override
  Widget build(BuildContext context) {
      return Material(
        child: InkWell(
          onTap: (){
          Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => moveToPage));
          },
        child: 
          Container(
            margin:  const EdgeInsets.only(bottom: 7.0,top: 7.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.2, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      0.5, // Move to bottom 10 Vertically
                    ),
                  )
                ],
            border: Border.all(
              color: Color(0xFF176F17), //#176F17
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0)
          ),
          height: 100.0,
          child: Row(
            children: <Widget>[
             imageOrIcon(
               icon,
               imagePath
             ),

             Container(
              width: MediaQuery.of(context).size.width/2,
              margin: EdgeInsets.only(left:10.0),
              child: nameOrButton(
                name,
                button, 
                MediaQuery.of(context).size.width/3,
                buttonPressed)
             ),


              Container(
              width: MediaQuery.of(context).size.width/5,
              child:  withpoints(points)
              ), 

            ],),),
      )
      );
  }
}





withpoints(String points){
if(points == null){
  return Container(
    child: Text("")
  );
}
else{
  return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          points,
          style: TextStyle(
            color: Color(0xFF176F17),
            fontWeight: FontWeight.bold,
            fontSize: 17.0
            ),
          overflow: TextOverflow.ellipsis,
        ),
        Image.asset("assets/images/Logo.png", width: 30.0)
      ],);
  }
}


imageOrIcon(IconData icon, String imgpath){
  if(imgpath != null && imgpath != ""){
    return 
      new Container(
          margin: const EdgeInsets.only(left:5.0),
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imgpath)
            ),
          )
        );
  }
  else{
    return  
    new Container(
        margin: const EdgeInsets.only(left:5.0),
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Color(0xFF176F17),
          shape: BoxShape.circle,
        ),
        child: new Icon(
          icon,
          color: Colors.white,
        )
      );
  }
}





nameOrButton(String name,bool button, double size,Function buttonPressed){
  if(button == true && button != null){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
          Text(
          name,
          textAlign: TextAlign.center,
          ),
          SizedBox(
          width:size,
          child:RaisedButton(
            onPressed: buttonPressed,
            child: Text("Add"),
            color: Color(0xFF176F17),
            textColor: Colors.white,
            )
          )
      ]
    );
  }
  else{
    return  Text(
          name,
          textAlign: TextAlign.center,
          );
  }

}
