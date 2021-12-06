import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';
class PasswordPage extends StatefulWidget {
   
String mail;
PasswordPage(this.mail);
  @override
  _PasswordPageState createState() => _PasswordPageState(mail);
}
class _PasswordPageState extends State<PasswordPage> {
  String mail;
_PasswordPageState(this.mail);

  bool _obscureText=true;
  bool _obscureText1=true;
  @override
  Widget build(BuildContext context) {
    final passwordsend = TextEditingController();
    final confirmsend = TextEditingController();
     GlobalKey<FormState> formState = new GlobalKey();

 String animationType = "hands_up";
String validPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value.trim().length < 4) {
      return "Field Cant Be Less Than 4 char";
    } else if (Value.trim().length > 20) {
      return "Field Cant Be Grater Than 20 Char";
    }
  }

String validConfirmPassword(var Value) {
    if (Value.trim().isEmpty) {
      return "Cant Be Empty";
    } else if (Value != passwordsend.text) {
      return "Password Does not Match ";
    }
  }


chepass() async {
   
    var formdata = formState.currentState;
    if (formdata.validate()) {
      var data = {"email": mail, "password": passwordsend.text};
      var url = "http://192.168.1.8:8081/WallySprouts/reserpassword.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
         setState(() {
                    animationType ="hands_down";
                   });
    
    showToast('Reset Done ',gravity: Toast.BOTTOM,duration: 3);
      Navigator.of(context).pushNamed('Login');
      }
    else{

print("not  ok ");
    }}}

 




      
    //EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar:AppBar(
        elevation: 100,
           centerTitle: true,
           backgroundColor:Color(0xff01a3a4),
           leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pushNamed(context, 'verify_email');},color:Colors.white,iconSize: 35.0,hoverColor: Colors.black),
            actions: <Widget>[
              //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
            ] ,
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
           title:Text("Wally Sprouts",style:
           TextStyle(color:Colors.white,
           fontFamily: 'DancingScript',
           fontSize: 30.0 ))),
        resizeToAvoidBottomInset: false,
        backgroundColor:Color(0xffdfe6e9) ,

      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1

                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO(106, 160, 176, 1.0),
                  Color(0xffdfe6e9),
                ],
              ),
            ),
            
          ),
           

          ),
             /* Positioned.fill(
         
       
        child: Container(
            height: 100,
            width: 500,
padding: EdgeInsets.only(top: 200),
             
                child: new FlareActor(
                  
                  "assets/doaflow(1).flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: "Flow", 
                  ),
              )),*/

 Positioned.fill(
         
       
        child: Container(
            height: 100,
            width: 100,
padding: const EdgeInsets.only(left: 70.0, right:70.0,top:175),
             
                child: new FlareActor(
                  
                  "assets/Teddy.flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: animationType, 
                  ),
              )),
Positioned.fill(
  
            child: SingleChildScrollView(
                 padding: EdgeInsets.only(
                    top: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                     child:Text("Reset password : "'\n',style:TextStyle(color:Colors.white,fontSize: 20.0),)
        
                      ),
                     Container(
         // resizeToAvoidBottomInset:true,
          height: 230,
          width: 370,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white
          ),
        child:Center(
           child:Form(
             key: formState,
          child: Column(
            children: <Widget>[

              TextFormField(
                controller:passwordsend ,
                // autovalidate: true,
                 validator:validPassword ,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                //  labelText: "Email",
                  hintText: "new password", 
                  labelText: "Password",
                   suffixIcon: IconButton(icon :Icon(
                  _obscureText ? Icons.visibility: Icons.visibility_off
                  
                  ),
                 onPressed: (){
                   setState(() {
                     _obscureText=!_obscureText;
                   });
                 }),
                  contentPadding: EdgeInsets.all(20)),
              ),
                
              Divider(color: Colors.lightBlue,thickness:1.0),

                TextFormField(
                controller:confirmsend ,
                // autovalidate: true,
                 validator:validConfirmPassword ,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                 
                  hintText: "Rewrite new password", 
                  labelText: "Confirm password",
                    suffixIcon: IconButton(
                      icon :Icon( _obscureText1 ? 
                  Icons.visibility: Icons.visibility_off
                  
                  ),
                 onPressed: (){
                   setState(() {
                     _obscureText1=!_obscureText1;
                   });
                 }),
                  contentPadding: EdgeInsets.all(20)),
              ),
                 Divider(color:Colors.lightBlue,thickness:1.0),
            ],
          ),
           ),
        ),
        ),
        SizedBox(
  height: 150.0,
),
               Container(
          width: 350,
          height: 70,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
              color: Color(0xff01a3a4),
              child: Text("Reset", 
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                 chepass();
              }
          ),
        ),           
                      
                    ])),
          ),
           
                              ],
                            )),
                          );
                    
  }
   void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }
}