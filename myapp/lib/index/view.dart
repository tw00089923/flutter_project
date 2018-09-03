import 'package:flutter/material.dart';
import 'package:myapp/index/bottomNav/bottomNav.dart';
import "package:myapp/user/model.dart" show User;
import 'dart:ui' show TextStyle, PointMode;


class IndexPage extends StatefulWidget{
  final User user;
  IndexPage({this.user});
  IndexPageState createState()=>  IndexPageState();
}


class IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      bottomNavigationBar: BottomNav(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children : <Widget>[
          Padding(padding: EdgeInsets.only(top:50.0),),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /*
              Flex(direction:Axis.horizontal,children:[Text("1")]),
              Flex(direction:Axis.horizontal,children:[Text("1")]),
              Flex(direction:Axis.horizontal,children:[Text("1")]),
              */
              Expanded(
                flex:4,
                child:  Container(
                  padding:EdgeInsets.all(12.0),
                  color:Colors.red,
                  child:Center(child: Text("1"))
                ),
              ),
              Expanded(
                flex:4,
                child:  Container(
                  padding:EdgeInsets.all(12.0),
                  color:Colors.blue,
                  child:Center(child: Text("1"))
                ),
              ),Expanded(
                flex:4,
                child:  Container(
                  padding:EdgeInsets.all(12.0),
                  color:Colors.yellow,
                  child:Center(child: Text("1"))
                ),
              )

            ],
          ),
          SizedBox(
            width:double.infinity,
            height:200.0,
            child: CustomPaint(
              painter: LineChart(title: "日前溫度")
            )
          )
        ],
      ),
    );
  }
}

class LineChart extends CustomPainter{
  List<Offset> points;
  final String title;
  LineChart({this.title});
  Offset x1 = Offset(0.0, 0.0);
  Offset x2 = Offset(0.0,10.0);
  List<Offset> lists = [Offset(12.0,12.0)];

  @override
  paint(Canvas canvas, Size size){
    Map<String, double> padding = {"top":20.0,"bottom":10.0,"left":10.0,"right":10.0};
    double height = size.height - padding["top"] - padding["bottom"] ;
    double width = size.width -padding["left"] - padding["right"];

    Paint paint = new Paint()
      ..strokeWidth = 2.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    Rect rect = new Rect.fromLTWH(padding["left"], padding["top"], width, height);
    
    canvas
    ..drawRect(rect, paint);
    canvas
    ..drawPoints(PointMode.points,lists , paint);

    //Title setting 
    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize:15.0,
        color: Colors.black
      ),
      text: title
    );
    TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset((width-tp.width)/2, 5.0));



  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}