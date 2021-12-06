 

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/social/commentmore.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Liked extends StatefulWidget {
  final postid;
  Liked(this.postid);

   @override
  _LikedState createState() => _LikedState(postid);
}

class _LikedState extends State<Liked> {
  TextEditingController addcomment = new  TextEditingController();
  final postid;
  _LikedState(this.postid);
 
List<Com> comnts = [
   
  ];
  //File _image;
   var user = "";
  var email = "";
  var id;
  bool textflag = false;
Future getlikes() async {
  
    var url = "http://192.168.1.8:8081/WallySprouts/getlike.php";
   var data={"postid":postid};
    var response = await http.post(url, body: data);
    var responcebody= json.decode(response.body);
    return responcebody;
    }
    
  
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user = preferences.getString("username");
      email = preferences.getString("email");
      id = preferences.getString("id");
      print("hhhhhhhhhh");
      print(user);
      print(email);
      print(id);
    });
  }
 /* Future addComment() async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/addcomment.php";
   var data={"comment": addcomment.text,"commentuser":id,"commentpost":postid};
    var response = await http.post(url, body: data);
    Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Socialbasic(0);
                               }));
     
  }*/
@override
  void initState() {
    getpref();
    getlikes();
    
    super.initState();
  }
  
  setmore(i) 
{  
  textflag=!textflag;
 if(!textflag)
  
    {
       
    setState(() {
      
       comnts[i].setmoref(true);
        });
    }
   
    else{
       
    setState(() {
      
       comnts[i].setmoref(false);
        });
    }
       

  }
  String animationType = "Like";
ListTile getlike( String username , String like_user,image  )
{  
 // print(com_id);
 //print(com_id);
 //print(comnts[12].getcid());
 //int  cid= int.parse(com_id);
 int cimd  ;
 int cidd;
 /*for(int c=0; c<comnts.length;c++)
 {
   cimd =int.parse(comnts[c].getcid());
   if(cidd == cimd)
   {
     cid=c;
     break;
   }
 }*/

 
 
return  ListTile(
 
                         
                        leading:CircleAvatar(radius:25.0,
                        backgroundImage:  NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$image"),
                         ),
                         title:Container(
                           margin:EdgeInsets.only(  right:202),
                           child: InkWell(
                           onTap: (){
                             print("vvvvvvvvvvvvvvvvvvvvvv");
                             print(like_user);
                             if (id == like_user)
                              Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Socialbasic(4);
                               }));
                               else{
                              Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return FrendPage( like_user,username,postid,"like","");
                               }));}
            },
                      child: Center(
              child: RichText(
                softWrap: true,
                overflow: TextOverflow.visible,
                text: TextSpan(
                    text: username,
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    children: [
                       
                      
                    ]),
              ),
            ),
          ),
                             
                            
                           
                   )) ;
                      
}

  @override
  Widget build(BuildContext context) {
     return Container(
        child:Scaffold(
          appBar: AppBar(
           // elevation: 30,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  /*Navigator.of(context).push(MaterialPageRoute(
                   builder:(context)=> Socialbasic(0)));*/
                  // comnts.remove("");
               Navigator.of(context).pop(MaterialPageRoute(
                               builder: (context){
                                   return Socialbasic(0);
                               }));
               
                },
                
                color: Colors.black,
                iconSize: 20.0,
                hoverColor: Colors.black),
                actions: <Widget>[
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Center(
              child: Container(
                  margin:EdgeInsets.only(  left:70),
                child: Row(
                   children:<Widget> [
                     Text("Likes",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'DancingScript',
                            fontSize: 25.0)),
                    
                       Container(
                  height: 400,
                  width: 50,
                  child: new FlareActor(
                    "assets/like-unlike.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ), 
        ] ) ),
            ) ),
          body: Stack(children: <Widget>[
           
           
          Positioned(top: 20,
          
          child: Container( 
            width:MediaQuery.of(context).size.width , 
            height:MediaQuery.of(context).size.height-120,
            
            child:SingleChildScrollView(
              child:FutureBuilder(
                future:getlikes() ,
                builder: (BuildContext contect , AsyncSnapshot snapshot)
           {
              if(snapshot.hasData){
              return  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget>[
                    Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                    
                 // print(snapshot.data[i]['image'],);
                /* for(int g=0;g<=snapshot.data.length;g++)
                {
                  comnts.add(Com.fromsnapshot(snapshot.data[i]));
                 
                  }
                  comnts.insert(i,Com( com_id: snapshot.data[i]['com_id'],));
                  /* print(snapshot.data[i]['com_id'])  ;
                    print(snapshot.data[i]['comment'])  ; */*/

                  return  getlike(
                          snapshot.data[i]['username'],
                          snapshot.data[i]['like_user'],
                          snapshot.data[i]['user_image'],
                          
                          
                         
                                  
                           

                        );
                                      
                },
              ),
            ),
                  /* for(int i=0;i<snapshot.data.length ;i++ )
                   { 
                         comnts.add(Com.fromsnapshot(snapshot.data[i])),
                        getcomment(
                          snapshot.data[i]['username'],
                          snapshot.data[i]['comment'],        
                           

                        )}*/
                        /*
                        Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                   
                 // print(snapshot.data[i]['image'],);
                 posts.add(Post.fromsnapshot(snapshot.data[i]));
                          
                  return getpostlist(
                                       snapshot.data[i]['username'],
                                       snapshot.data[i]['post_user'],
                                      snapshot.data[i]['caption'],
                                      snapshot.data[i]['image'],
                                      snapshot.data[i]['vedio'],
                                      snapshot.data[i]['is_vedio'],
                                       int.parse(snapshot.data[i]['post_id']) );
                                      
                },
              ),
            )
                        */
                        
          ],);}
          return Center( );
           }
           
                              
              )),),),
            /*  Positioned(
             bottom:100,
             child: Container(
             color:Colors.white,
             height:400,
             width:MediaQuery.of(context).size.width,
             child:Column(children:<Widget>[
                Row(children: <Widget>[
                   Container(
                height: 400,
                width: 50,
                child: new FlareActor(
                  "assets/like-unlike.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
                 ]),
                 // 
                ],
                )

          )
          ),*/
        /* FutureBuilder(
           future:getcomments(),
           builder: (BuildContext contect , AsyncSnapshot snapshot)
           {
             return getcomment(
                    snapshot.data[i]['username']




             );
           }
           )*/
         // getcomment()
          ]))


            ); 
               





          






        


     
  }
}
