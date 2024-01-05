import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Color color;
  final double size;

  const CircleButton({this.onTap, this.iconData, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration:
            new BoxDecoration(
              color: color, 
              shape: BoxShape.circle, 
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 40.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      10.0, // horizontal, move right 10
                      10.0, // vertical, move down 10
                    )),
              ]),
        child: new Icon(
          iconData,
          color: Colors.white,
          size: size / 1.2,
        ),
      ),
    );
  }
}
