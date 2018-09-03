import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:myapp/user/controller.dart' show getjwt;

Future taskpost(String name, String clf, String jwt) async{
  var url = "http://127.0.0.1:8080/api/v1/board";
  var body = {"name":name,"classifer":clf};
  await http.post(url,body: body).then(
  (http.Response res){
    if (res.statusCode == 200){
      print(res);
    }
  }).catchError((err){
    print(err);
  });
}


Future taskget(String name, String password) async {
  var url = "http://127.0.0.1:8080/auth";
  var body = {"username":name,"password":password};
  await http.Client().get(url).then(
  (http.Response res){
    print(res.statusCode);
    if (res.statusCode == 200){
      print(res);
    }
  }).catchError((err){
    print(err);
  });
}