import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
 
import 'package:flutter/rendering.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'insertkey.dart';
 
class EmailPage extends StatefulWidget {
   

  @override
  _EmailPageState createState() => _EmailPageState();
}
class _EmailPageState extends State<EmailPage> {
     final emailsend = TextEditingController();
     GlobalKey<FormState> formState = new GlobalKey();
     int keysend ;
    Random key =new Random();
   
////////////////////////////////////send email
sendMail() async {
    keysend=key.nextInt(10000);

    String username = 'testtestflutter@gmail.com';
    String password = 'doaa12345678';//passsword

    final smtpServer = gmail(username, password);
     

     
    final message = Message()
      ..from = Address(username)
      ..recipients.add(emailsend.text)  
     
      ..subject =
          'Your verification code is : ${keysend}' //subject of the email
      //..text =
       
      ..html =
          "<h3>Thank you for joining Wally’s world ! :) "
          "your verification code is :${keysend}</h3>\n<p></p>"
                 
          
          ; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      showToast('Message Send Check your mail',gravity: Toast.BOTTOM,duration: 3);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
          Navigator.of(context).push(MaterialPageRoute(
     builder:(context)=> KeyPage(keysend,emailsend.text)


    )
    
    );
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
}


String validEmail(var Value) {
    if (Value.trim().isEmpty) {
      return "This faild Cant Be Empty";
    }
  }

email() async {
    var formdata = formState.currentState;
    if (formdata.validate()) {
      formdata.save();
      var data = {"email": emailsend.text};
      var url = "http://192.168.1.8:8081/WallySprouts/email.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(" ok ");
     sendMail();
      }
      else {
        print("not ok");
        showToast('This email is not registered yet',gravity: Toast.BOTTOM,duration: 3);
        }
    }
}
















  @override
  Widget build(BuildContext context) {
    //EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
        appBar:AppBar(
        elevation: 100,
           centerTitle: true,
           backgroundColor:Color(0xff01a3a4),
           leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pushNamed(context, 'Login');},color:Colors.white,iconSize: 35.0,hoverColor: Colors.black),
            actions: <Widget>[
              //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
            ] ,
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
           title:Text("Wally Sprouts",style:
           TextStyle(color:Colors.white,
           fontFamily: 'DancingScript',
           fontSize: 30.0 ))),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffdfe6e9),

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
              Positioned.fill(
         
       
        child: Container(
            height: 100,
            width: 500,
padding: EdgeInsets.only(top: 90),
             
                child: new FlareActor(
                  
                  "assets/doaflow(1).flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: "Flow", 
                  ),
              ),
 
             ),

Positioned.fill(
  
            child: SingleChildScrollView(
                 padding: EdgeInsets.only(
                    top: 40,left: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                     right: 169),
                     child:Text("Forgot password ?" ,
                     style:TextStyle(color:Colors.teal,
                     fontSize: 20.0),
                     textAlign: TextAlign.left,
                    )
        
                      ),
                      Container(
                        padding: EdgeInsets.only(
                     right: 2),
                     child:Text("We will send a key for you to reset your password: "'\n',
                     style:TextStyle(color:Colors.white,
                     fontSize: 15.0),
                     textAlign: TextAlign.left,
                    )
        
                      ),
                      
                     Container(
         // resizeToAvoidBottomInset:true,
          height: 110,
          width: 350,
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
                controller:emailsend ,
                // autovalidate: true,
                 validator:validEmail ,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                //  labelText: "Email",
                  hintText: "What's your email address?", 
                  labelText: "Email",
                   suffixIcon: IconButton(icon:Icon(Icons.lock), onPressed: null,color:Colors.blue) ,
                  contentPadding: EdgeInsets.all(20)),
              ),
                
             // Divider(color: Colors.lightBlue,thickness:1.0),

               
                 //Divider(color:Colors.lightBlue,thickness:1.0),
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
              child: Text("send key", 
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                email();
               
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
