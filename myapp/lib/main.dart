import 'package:flutter/material.dart';
import 'src/theme.dart';
//import 'landingPage.dart';
import 'user/view.dart';
import 'package:myapp/index/view.dart';
import 'package:myapp/setting/view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme Setting in src .theme
      theme : MyAppTheme.theme,
      home : new Scaffold(
        body : new LoginPage() //LandingPage()
      ),
      routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => new LoginPage(),
      '/index': (BuildContext context)=> new IndexPage(),
      '/setting':(BuildContext context)=> new SettingPage()
      /*'/setting': (BuildContext context)=> new SettingPage(),*/
      },
    );
  }
}
