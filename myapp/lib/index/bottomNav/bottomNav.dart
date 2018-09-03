import 'package:flutter/material.dart';

class BotItems {
  final Icon icon;
  final String path;
  BotItems({this.icon,this.path});
}

final List<BotItems> items = [
  BotItems(icon: new Icon(Icons.home) ,path: '/index'),
  BotItems(icon: new Icon(Icons.satellite) ,path: '/login'),
  BotItems(icon: new Icon(Icons.camera) ,path: '/a'),
  BotItems(icon: new Icon(Icons.settings) ,path: '/setting'),

];

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      clipper: new ClipCustom(),
      child: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((value){
              return new IconButton(
                onPressed: ()=> Navigator.pushNamed(context,value.path)
                ,icon: value.icon,
              );
            }
          ).toList()
        ),
      ),
    );
  }
}
class ClipCustom extends CustomClipper<Path>{
  @override
  getClip(Size size) {
      // TODO: implement getClip
    Path path = new Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width/2 + 20.0, 0.0)
      ..lineTo(size.width/2 - 20.0, 0.0);
      return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
      // TODO: implement shouldReclip
      return false;
    }
}