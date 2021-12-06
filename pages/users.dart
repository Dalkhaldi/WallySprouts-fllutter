import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
 
import 'package:flutter/rendering.dart';
class UsersPage extends StatefulWidget {
   

  @override
  _UsersPageState createState() => _UsersPageState();
}
class _UsersPageState extends State<UsersPage> {
   
  @override
  Widget build(BuildContext context) {
    //EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
        /*appBar:AppBar(
        elevation: 100,
           centerTitle: true,
           backgroundColor:Color(0xff01a3a4),
           leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
           onPressed: (){
                   Navigator.of(context).pushNamed('welcome');  


           }
           ,color:Colors.white,iconSize: 35.0,hoverColor: Colors.black),
            actions: <Widget>[
              //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
            ] ,
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
           title:Text("Wally Sprouts",style:
           TextStyle(color:Colors.white,
           fontFamily: 'DancingScript',
           fontSize: 30.0 ))),*/
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38,50,56,1),

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
            padding: EdgeInsets.only(top: 15),
          child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed('users');
                }
                   
             ))),
             Positioned.fill(
         
       
        child: Container(
            height: 40,
            width: 1200,
//padding: EdgeInsets.only(top: ),
             
                child: new FlareActor(
                  
                  "assets/dtop(6).flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: "Flow", 
                  ),
              ),
 
             ), 
            
            
           
            
             Positioned.fill(
         
       
        child: Container(
            height: 100,
            width: 500,
padding: EdgeInsets.only(top: 217),
             
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
                    top: 200,),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                     
               Container(
          width: 350,
          height: 80,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
              color: Colors.white,
              child: Text("I am user", 
              style: TextStyle(color: Colors.black, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(13),
              ),
              onPressed: () {
                 Navigator.of(context).pushNamed('liquid_swipe');
              }
          ),
        ),  
         SizedBox(
  height: 35.0,
),         
               Container(
          width: 350,
          height: 80,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
              color: Colors.white,
              child: Text("I am Admin", 
              style: TextStyle(color: Colors.black, fontSize: 20.0),textAlign:TextAlign.left),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(13),
              ),
              onPressed: () {
                 Navigator.of(context).pushNamed('loginAdmin');
              }
          ),
        ),    
         SizedBox(
  height: 118.0,
),             
        /*  Container(
            height: 200,
            width: 300,

             
                child: new FlareActor(
                  "assets/teddy_test.flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                 // animation: animationType, 
                  ),
              ),   */     
                    ])),
          ),
           
                              ],
                            )),
                          );
                    
  }
}


