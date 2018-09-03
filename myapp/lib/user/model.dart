
import 'package:dbcrypt/dbcrypt.dart';


class User{
  num id;
  final String username;
  final String email;
  String password;
  User({this.username,this.email,this.password});
  User.fromJson(Map<String,dynamic> json)
    : username = json["username"],
      email = json["email"],
      password = json["password"];
  bool checkpw(String password){
    String _password = this.password.substring(2, this.password.length-1);
    return DBCrypt().checkpw(password,_password);
  }


  Map<String, dynamic> toJson()=>{
    'username':username,
    'email':email,
    'password':password
  };


}


