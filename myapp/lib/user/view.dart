import 'package:myapp/user/model.dart';
import 'package:flutter/material.dart';
import 'package:myapp/index/view.dart';
import 'package:myapp/user/controller.dart';

class LoginPage extends StatefulWidget{
  LoginState createState()=>  LoginState();
}
class LoginState extends State<LoginPage> {
  // State 
  bool login = false ;
  User user; // 之後 用shared_preferences 
  bool showpassword = false;
  Map errors = {'email':null, 'password':null, 'other':null };

  final GlobalKey <FormState> _formkey =  GlobalKey<FormState>();
  final GlobalKey <FormFieldState<String>> _emailkey =  GlobalKey<FormFieldState<String>>();
  final GlobalKey <FormFieldState<String>> _passwordkey = GlobalKey<FormFieldState<String>>();
  


  @override
  initState(){
    super.initState();
    user = User(username: "admin",email: "tw00089923@gmail.com",password: "812323");
  }
  @override
  dispose(){
    super.dispose();
  }
  String _pwdvalidate(String value){
    if(value.length < 0){
      return "字數過少, 密碼請設定6-8個字" ;
    }else if(value.length >15){
      return "密碼超過15字的上限" ;
    }else{
      return null;
    }
  }
  void _login(){
    _formkey.currentState.save();
    if (_formkey.currentState.validate()){
      _emailkey.currentState.save();
      _passwordkey.currentState.save();
      String email = _emailkey.currentState.value.toLowerCase().trimRight();
      String password = _passwordkey.currentState.value.toLowerCase().trimRight();
      userlogin(email,password).then(
        (value){
          if (value["login"]) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>IndexPage(user:user)
            ));
          } else {
            String type =  value["type"];
            String message = value["err"];
            setState((){
              errors[type] = message;
            });
          }

      }).catchError((err){

      });
      
      
      /*
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IndexPage(user: user,),
        ),
      );
      */
      /*
      getjwt(username,password).then((value){
        posttask(value);
      }).catchError((err){
        print(err);
      });
      */
    }
  }
  void _clean(){
    _emailkey.currentState.reset();
    _passwordkey.currentState.reset();
    setState(()=>login=false);
  }

  _onchange(bool value){
    setState(()=>
      showpassword = value
    );
  }
  Widget _button(Function fun, String string, bool login){
    return RaisedButton(
      color: login? Colors.red : Colors.blue,
      onPressed: fun,
      child: Text(string),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(   
        key: _formkey,
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-40,
                height: 300.0,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[400],
                  image: DecorationImage(
                    image:AssetImage('assets/img_Landing.png'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child:  TextFormField(
                  keyboardType:  TextInputType.url,
                  initialValue: user.email,
                  autofocus: false,
                  key: _emailkey,
                  decoration:  InputDecoration(
                    labelText: "E-mail",
                    icon: Icon(Icons.email),
                    errorText: errors['email'],
                  ),
                ),
              ),
              TextFormField(
                validator: _pwdvalidate,
                keyboardType:  TextInputType.multiline,  
                initialValue: user.password,      
                obscureText: showpassword,
                key:_passwordkey,
                decoration: InputDecoration(
                  labelText: "Password",
                  icon:  Icon(Icons.label),
                  errorText: errors['password'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Checkbox(
                      onChanged: _onchange ,
                      value: showpassword,
                    ),
                    Text(showpassword?"顯示密碼":"隱藏密碼"),
                    SizedBox(width: 10.0,),
                    login? _button( _clean, "clean" ,login) : _button(_login,"Login",login),
                  ],
                )
              ),
            ],
          ),
        ),  
      ),
    );
  }
}