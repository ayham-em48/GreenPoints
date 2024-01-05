import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  int color;
  double bottom;
  double height;
  IconData icon1;
  Object icon1MoveTo;
  IconData icon2;
  Object icon2MoveTo;
  IconData icon3;
  Object icon3MoveTo;
  MainAxisAlignment align;
  List text;
  Color iconsColor;
  //int _borderColor;

  Section(
      {this.color,
      this.bottom,
      this.height,
      this.icon1,
      this.icon1MoveTo,
      this.icon2,
      this.icon2MoveTo,
      this.icon3,
      this.icon3MoveTo,
      this.align,
      this.text,
      this.iconsColor});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      child: Container(
          decoration: BoxDecoration(color: Color(color),
              //border: Border(top: BorderSide(width:3.0, color: Color(_borderColor))),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 30.0, // has the effect of softening the shadow
                    spreadRadius: 2.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 0
                      5.0, // vertical, move down 5
                    )),
              ]),
          child: Row(
            mainAxisAlignment: align,
            children: <Widget>[
              new IconButton(
                icon: Icon(icon1),
                color: iconsColor,
                iconSize: 50.0,
                onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => icon1MoveTo));
                },
              ),
              history(
                text,
                icon2,
                iconsColor,
                icon2MoveTo,
                context
              ),
              new IconButton(
                icon: Icon(icon3),
                color: iconsColor,
                iconSize: 50.0,
                onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => icon3MoveTo));
                },
              ),
            ],
          )),
      bottom: bottom,
      height: height,
      width: MediaQuery.of(context).size.width,
    );
  }
}

history([List text, IconData icon2, Color iconsColor, Object moveto, BuildContext context]) {
  String t = "";
  // for avoiding a design error with the spacing between widgets
  // and adding the list of histoty at the same time
  if (text == null) {
        return IconButton(
          icon: Icon(icon2),
          color: iconsColor,
          iconSize: 50.0,
          onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => moveto));
                },
          ); 
  } 
  else {
    for (int i = 0; i < text.length; i++) text[i] = " +15";

    for (int i = 0; i < text.length; i++) t += text[i];

    return Flexible(// added Flexible for rendering issues with the overflow
    child: new Text(
      t,
      style: TextStyle(fontSize: 30.0, color: Color(0xFF176F17),),
      overflow: TextOverflow.ellipsis,
    ));
  }
}
