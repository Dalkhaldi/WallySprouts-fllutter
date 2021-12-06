import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome>
 {
   String animationType = "idle";
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
          
      body:Container(
         // width: 100,
         // height: ,
          
          child: Stack(
        children: <Widget>[
          Positioned.fill(
            
              child: Container(
            height: 700 ,
            width: 1200,
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1

                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO(42, 97, 173, 1.0),
                  Color.fromRGBO(222, 87, 185, 1.0),
                ],
              ),
            ),
              
                child: new FlareActor(
                  "assets/doaa(2).flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: "Untitled", 
                  ),
          ),
           

          ),
             

Positioned.fill(
  
            child: SingleChildScrollView(
                 padding: EdgeInsets.only(
                    top: 70),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(onPressed: null, child: Text("Go with Wally and make your world with children's more exciting" ,style:TextStyle(color:Colors.black,fontSize: 30.0,fontFamily: 'DancingScript'))
        ),
         
                      SizedBox(
  height: 370.0,
),
                     Container(
         // resizeToAvoidBottomInset:true,
          height:400,
          width: 1000,
          
        child:Center(
           child:Form(
            // key: formState,
          child: Column(
            children: <Widget>[
               Container(
            height: 120,
            width: 250,

             
                child: new FlareActor(
                  "assets/teddy_test.flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: animationType, 
                  ),
              ),
                Container(
          width: 210,
          height: 40,
          padding: EdgeInsets.only(top: 0),
          child: RaisedButton(
              color: Color(0xf00cec9),
              child: Text("..GO..", 
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                 Navigator.of(context).pushNamed('users');
              }
          ),
        ),           
         
             // backgroundColor: Colors.white,
           
           
       
            ],
          ),
           ),
        ),
        ),
        
               
       
                    ])),
          ),
           
                              ],
                            )
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      ));
  }}
         
      
     