import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future userlogin(String email, String password) async {
  var url = "http://127.0.0.1:8080/api/v1/auth";
  return await http.Client().post(
    url,
    body:{
      "email":email,
      "password":password
    }).then(
    (res){
      if (res.statusCode == 200) {
        return {"login":true};
      } else {
        return {"login":false,"err":json.decode(res.body)["message"] ,"type":json.decode(res.body)["type"] };
      }
    }
  ).catchError((err){
    return { "message" : "用戶存在" };
  });
}

Future createUser(String username, String email, String password) async {
  var url = "http://127.0.0.1:8080/api/v1/auth/create";
  return await http.Client().post(
    url,
    body:{
      "username":username,
      "email":email,
      "password":password,
    }).then(
    (res){
      if (res.statusCode == 200){
        return {"message":json.decode(res.body)["message"]};
      }else{
        print(json.decode(res.body)["message"]);
        return {"message":json.decode(res.body)["message"]};
      }
    }
  ).catchError((err){
    return { "message" : "用戶存在" };
  });
}

Future gettask(String jwt) async{
  var url = "http://127.0.0.1:8080/api/v1/board";
  var body = {"name":"ads","classifer":"asd"};
  http.get(url).then((value){
    print(value.body);
    print(jwt);
  });
}

Future posttask(String jwt) async{
  var url = "http://127.0.0.1:8080/api/v1/board";
  var body = {"name":"ads","classifer":"asd"};
  var restjwt = "JWT "+jwt;
  http.post(
    url,
    body: body,
    headers: {"Authorization":restjwt}
  ).then((value){
    print(value.body);
  });
}


Future getjwt(String username, String password) async {
  var url = "http://127.0.0.1:8080/auth";
  var body = {"username":username,"password":password};
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return json.decode(reply)['access_token'];
}
