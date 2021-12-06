import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/other/homestart.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  String type = "u";
  String usernamepref;
  String emailpref;
  String passwordpref;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  GlobalKey<FormState> formState = new GlobalKey();

  String validGlobal(var Value) {
    if (Value.trim().isEmpty) {
      return "This field Cant be Empty";
    }
  }

  String validPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    }  
  }

  String validEmail(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    }  
   /* RegExp regexp = new RegExp(pattern);
    if (!regexp.hasMatch(Value)) {
      return "Email Is Not Valid ";
    }*/
  }

  String validUserName(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    }  
  }

  signin() async {
    var formdata = formState.currentState;
    if (formdata.validate()) {
      formdata.save();
       var data = {"username": userName.text,"email": email.text, "password": passwordController.text,"type": type};
      var url = "http://192.168.1.8:8081/WallySprouts/login.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
        savepref(responsebody['username'], responsebody['email'],
            responsebody['id']);
        setState(() {
          animationType = "success";
        });
        Navigator.of(context).pushNamed('home');
      /*  MaterialPageRoute(
       builder: (context) => HomePagestart(//intsectionchildren//HomePagestart
                            
                          ),
                        );*/
                      
      } else {
        print("not ok");
        setState(() {
          animationType = "fail";
        });
      }
    }
  } //signin

  String animationType = "idle";

  final passwordFocusNode = FocusNode();
  savepref(String name, String mail, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     print( preferences.setString("username", name));
     print( preferences.setString("email", mail));
     print( preferences.setString("id", id));
    });
  }
getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     var  user = preferences.getString("username");
     var  email = preferences.getString("email");
     var id = preferences.getString("id");
     if(user!=null && email !=null && id!=null)
     Navigator.of(context).pushNamed("social_home");
      print(user);
      print(email);
      print(id);
    });
  }
  @override
  void initState() {
   // getpref();
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
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

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 100,
            centerTitle: true,
            backgroundColor: Color(0xff01a3a4),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed('liquid_swipe');
                },
                color: Colors.white,
                iconSize: 35.0,
                hoverColor: Colors.black),
            actions: <Widget>[],
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
                height: 190,
                width: 250,
                child: new FlareActor(
                  "assets/teddy_test.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
            ),
            SizedBox(
              width: 280,
            ),
            Container(
              width: 340,
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
                        validator: validUserName,
                        autovalidate: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "User Name",
                            labelText: "User Name",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.account_box),
                                onPressed: null,
                                color: Colors.blue),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                      TextFormField(
                        controller: email,
                        validator: validEmail,
                        autovalidate: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's your email address?",
                            labelText: "Email",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.email),
                                onPressed: null,
                                color: Colors.blue),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                      TextFormField(
                        obscureText: _obscureText,
                        autovalidate: true,
                        validator: validPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            
                            hintText: "What's your password?",
                            labelText: "password",
                            suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                }),
                            contentPadding: EdgeInsets.all(20)),
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Color(0xff01a3a4),
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    signin();
                  }),
            ),
             InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'verify_email');
            },
                      child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'forgot your password?',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Reset',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 17),
                      )
                    ]),
              ),
            ),
          ),
            SizedBox(
              height: 285,
            ),
          ],
        ))));
  }
}







/*import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  String usernamepref;
  String emailpref;
  String passwordpref;

  GlobalKey<FormState> formState = new GlobalKey();





  String validGlobal(var Value) {
    if (Value.trim().isEmpty) {
      return "This field Cant be Empty";
    }
  }

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
      return "Cant Be Empty";
    } else if (Value.trim().length < 4) {
      return "Field Cant Be Less Than 4 Letter";
    } else if (Value.trim().length > 20) {
      return "Field Cant Be Grater Than 20 Letter";
    }
  }

  signin() async {
    var formdata = formState.currentState;
    if (formdata.validate()) {
      formdata.save();
      var data = {"username": userName.text,"email": email.text, "password": passwordController.text};
      var url = "http://192.168.1.11:8081/WallySprouts/login.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
         setpref(responsebody['username'], responsebody['email'],
            responsebody['id']);
        setState(() {
          animationType = "success";
        });
        Navigator.of(context).pushNamed('social_home');
      } else {
        print("not ok");
        setState(() {
          animationType = "fail";
        });
      }
    }
  } //signin

   

  String animationType = "idle";

  final passwordFocusNode = FocusNode();
    setpref(String s1, String s2, String s3) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("username", s1);
      preferences.setString("email", s2);
      preferences.setString("id", s3);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
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

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 100,
            centerTitle: true,
            backgroundColor: Color(0xff01a3a4),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed('liquid_swipe');
                },
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
          // resizeToAvoidBottomInset:true;
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //just for vertical spacing
            SizedBox(
              height: 60,
              // width: 200,
            ),

            //space for teddy actor
            Center(
              child: Container(
                height: 190,
                width: 250,
                child: new FlareActor(
                  "assets/teddy_test.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
              // backgroundColor: Colors.white,
            ),

            //just for vertical spacing
            SizedBox(
              // height: 1,
              width: 280,
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
                        validator: validUserName,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "User Name",
                            labelText: "User Name",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.account_box),
                                onPressed: null,
                                color: Colors.blue),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      TextFormField(
                        controller: email,
                        validator: validEmail,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's your email address?",
                            labelText: "Email",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.email),
                                onPressed: null,
                                color: Colors.blue),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                      TextFormField(
                        obscureText: _obscureText,
                        validator: validPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's your password?",
                            labelText: "password",
                            suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                }),
                            contentPadding: EdgeInsets.all(20)),
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              // resizeToAvoidBottomInset:true,
              height: 230,
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
                        controller: email,
                        // autovalidate: true,
                        validator: validEmail,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            //  labelText: "Email",
                            hintText: "What's your email address?",
                            labelText: "Email",
                            suffixIcon: IconButton(
                                icon: Icon(Icons.lock),
                                onPressed: null,
                                color: Colors.blue),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                      TextFormField(
                        obscureText: _obscureText,
                        // autovalidate: true,
                        validator: validPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // labelText:"Password" ,
                            hintText: "What's your password?",
                            labelText: "password",
                            suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                }),
                            contentPadding: EdgeInsets.all(20)),
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                      ),
                      Divider(color: Colors.lightBlue, thickness: 1.0),
                    ],
                  ),
                ),
              ),
            ),

            //container for raised button
            Container(
              width: 350,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Color(0xff01a3a4),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    signin();
                  }),
            ),
                SizedBox(
              height: 10,
            ),
            InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'verify_email');
            },
                      child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'forgot your password?',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Reset',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 17),
                      )
                    ]),
              ),
            ),
          ),
            SizedBox(
              height: 100,
            ),
          ],
        ))));
  }
}*/
