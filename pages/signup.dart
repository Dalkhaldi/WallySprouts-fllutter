import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;
import 'package:wallysprouts/pages/Login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  String animationType = "idle";
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final userName = TextEditingController();
  final email = TextEditingController();
  final conforimpassword = TextEditingController();
  final passwordController = TextEditingController();
  final city = TextEditingController();
  final passwordFocusNode = FocusNode();
  final conforimpasswordFocusNode = FocusNode();

  GlobalKey<FormState> formState = new GlobalKey();

  Future signUp() async {
    var formData = formState.currentState;
    if (formData.validate()) {
      formData.save();
      var data = {
        "email": email.text,
        "password": passwordController.text,
        "username": userName.text
      };
      var url = "http://192.168.1.8:8081/WallySprouts/signup.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
        setState(() {
          animationType = "success";
         /* MaterialPageRoute(
       builder: (context) => LoginScreen(//intsectionchildren//HomePagestart
                            
                          ),
                        );*/
                        Navigator.of(context).pushNamed('Login');
        });
      //  
       
      } else {
        print("not ok");
        setState(() {
          animationType = "fail";
        });
      }
    }
  }

  String validGlobal(var Value) {
    if (Value.trim().isEmpty) {
      return "Field Cant be Empty";
    }
  }

  String validUserName(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value.trim().length < 4) {
      return "Field Cant Be Less Than 4 Letter";
    } else if (Value.trim().length > 20) {
      return "Field Cant Be Grater Than 20 Letter";
    }
  }

  String validPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value.trim().length < 4) {
      return "Field Cant Be Less Than 4 char";
    } else if (Value.trim().length > 20) {
      return "Field Cant Be Grater Than 20 Char";
    }
  }

  String validEmail(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value.trim().length < 4) {
      return "Field Cant Be Less Than 4 char";
    } else if (Value.trim().length > 40) {
      return "Field Cant Be Grater Than 40 Char";
    }
    RegExp regexp = new RegExp(pattern);
    if (!regexp.hasMatch(Value)) {
      return "Email Is Not Valid ";
    }
  }

  String validConfirmPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value != passwordController.text) {
      return "Password Does not Match ";
    }
  }

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus && conforimpasswordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 100,
          centerTitle: true,
           backgroundColor: Color(0xff01a3a4),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {Navigator.of(context).pushNamed('liquid_swipe');},
              color: Colors.white,
              iconSize: 35.0,
              hoverColor: Colors.black),
          actions: <Widget>[
            //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
          ],
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
          title: Text("Wally Sprouts",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'DancingScript',
                  fontSize: 30.0))),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffdfe6e9),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),

              Center(
                child: Container(
                  height: 180,
                  width: 280,
                  child: new FlareActor(
                    "assets/teddy_test.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Center(
                  child: Form(
                    key: formState,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: userName,
                          autovalidate: true,
                          validator: validUserName,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "User name",
                              contentPadding: EdgeInsets.all(20)),
                        ),
                        TextFormField(
                          autovalidate: true,
                          controller: email,
                          validator: validEmail,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email ",
                              contentPadding: EdgeInsets.all(20)),
                        ),
                        TextFormField(
                          autovalidate: true,
                          controller: city,
                          validator: validGlobal,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "City",
                              contentPadding: EdgeInsets.all(20)),
                        ),
                        Divider(),
                        TextFormField(
                          obscureText: true,
                          autovalidate: true,
                          validator: validPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              contentPadding: EdgeInsets.all(20)),
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                        ),
                        Divider(),
                        TextFormField(
                          obscureText: true,
                          autovalidate: true,
                          validator: validConfirmPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "confirm password",
                              contentPadding: EdgeInsets.all(20)),
                          controller: conforimpassword,
                          focusNode: conforimpasswordFocusNode,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //container for raised button
              Container(
                width: 350,
                height: 60,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    color:  Color(0xff01a3a4),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white,fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      signUp();
                    }),
              ),
              SizedBox(
                height: 285,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
