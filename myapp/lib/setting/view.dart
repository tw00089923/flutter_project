import 'package:flutter/material.dart';
import 'package:myapp/index/bottomNav/bottomNav.dart';
import 'dart:math';

class SettingPage extends StatefulWidget{
  SettingPageState createState()=>  SettingPageState();
}


class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding:EdgeInsets.only(top:30.0)),
          SettingSwitch(title: "Love", changed: null,)
        ],
      )
    );
  }
}

class SettingSwitch extends StatelessWidget {
  final String title;
  final bool changed;
  SettingSwitch({this.title,this.changed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Text(
          title,

        ),
        Switch(
          value: false,
          onChanged: null,
        )
      ]
    );  
  }
}