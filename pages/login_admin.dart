 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:toast/toast.dart';

 

class LoginAdminScreen extends StatefulWidget {
  @override
  _LoginAdminScreenState createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  GlobalKey<FormState> formStateusername = new GlobalKey();
  GlobalKey<FormState> formStatepass = new GlobalKey();
  GlobalKey<FormState> formStateemail = new GlobalKey();
  
String type = "a";
  
  String validPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    }  
  }
String validEmail(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    } 
    } 

  String validUserName(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    }  
  }
signin() async {
    var formdata1 = formStateusername.currentState;
    var formdata2 = formStatepass.currentState;
    var formdata3 = formStateemail.currentState;
    if (formdata1.validate() &&formdata2.validate() &&formdata3.validate()) {
      formdata1.save();
      formdata2.save();
      formdata3.save();
       var data = {"username": userName.text,"email": email.text, "password": passwordController.text,"type": type};
      var url = "http://192.168.1.8:8081/WallySprouts/login.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
          
   // Navigator.of(context).pushNamed('social_home');
      } else {
        print("not ok");
         showToast('This Admin  not registered yet',gravity: Toast.BOTTOM,duration: 1);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 190,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("images/Sign.png")
                    )
                    ),
          ),
           Form(
             key: formStateusername,
        child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextFormField(
                           controller: userName,
                            validator: validUserName,
                          decoration: InputDecoration(hintText: 'Admin Name'),
                        )))
              ],
            ),
          )),
           Form(
             key: formStateemail,
        child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.email), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextFormField(
                           controller: email,
                            validator: validEmail,
                          decoration: InputDecoration(hintText: 'Admin Email'),
                        )))
              ],
            ),
          )),
          Form(
            key: formStatepass,
         child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextFormField(
                          controller: passwordController,
                            validator: validPassword,
                          decoration: InputDecoration(hintText: 'Password'),
                        ))),
              ],
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    signin();},
                  color: Color(0xFF00a79B),
                  child: Text(
                    'log in',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: (){
             // Navigator.pushNamed(context, 'SignUp');
            },
                      child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
   void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }
}
