 

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/social/commentmore.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Comment extends StatefulWidget {
  final postid;
  Comment(this.postid);

   @override
  _CommentState createState() => _CommentState(postid);
}

class _CommentState extends State<Comment> {
  TextEditingController addcomment = new  TextEditingController();
  final postid;
  _CommentState(this.postid);
 
List<Com> comnts = [
   
  ];
  //File _image;
   var user = "";
  var email = "";
  var id;
  bool textflag = false;
Future getcomments() async {
  
    var url = "http://192.168.1.8:8081/WallySprouts/getcomment.php";
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
  Future addComment() async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/addcomment.php";
   var data={"comment": addcomment.text,"commentuser":id,"commentpost":postid};
    var response = await http.post(url, body: data);
    Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(postid);
                               }));
     
  }
  Future deletcomment(com_id) async {
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/deletcomment.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['com_id'] = com_id;

    var response = await request.send();
    if (response.statusCode == 200) {
     // _Alert(context, "Event Deleted");
      print(' Deleted');
      Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(postid);
                               }));
    } else {
     // _Alert(context, "Event Not Deleted");
      print(' Not Deleted');
    }
  }
  Widget buttonset(com_id )
     {
       return  Container(
            
           height:100,
           //Color(0xf00cec9) ,
           width:MediaQuery.of(context).size.width,
           margin:EdgeInsets.symmetric(
             horizontal:10,
             vertical:20
             
           ),
            
          
           child: Column(
             children: <Widget>[
               Text(
                 "Comment",
                 style: TextStyle(
                   fontFamily: 'DancingScript',
                   fontSize: 20
                 ),
                 
               ),
               Divider(color: Colors.black,thickness:0.2),
               
                    
               
                   FlatButton(onPressed: (){ 
                   showDialog(
                     context: context,
                     builder: (context){
                       return AlertDialog(
                         title: Text("Delete comment!"),
                         content: Text("Are you sure you want to delete your comment"),
                         actions:<Widget> [
                            FlatButton(
                              child:Text("Yes"),
                              onPressed:(){deletcomment(com_id);},
                            ),
                            FlatButton(
                              child:Text("No"),
                              onPressed:(){Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(postid);
                               }));},
                            ),

                         ],
                       );
                     }
                     
                   );


                   }, child: Text("Delete comment" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
                
               
             ],

           ),
           
         );
       

     }
@override
  void initState() {
    getpref();
    getcomments();
    
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
  int c;
  String animationType = "verified";
Column getcomment(String com_id,String username , String comment, com_user ,userimage)
{  
 // print(com_id);
// print(com_id);
 //print(comnts[12].getcid());
 int  cidd= int.parse(com_id);
 int cimd  ;
 int cid;
 for(c=0; c<=comnts.length;c++)
 {
   cimd =int.parse(comnts[c].getcid());
   print("thata it ");
   print(comnts[c].getcid());

   if(cidd == cimd)
   {
     print(c);
     cid=c;
     break;
   }
 }
print (cid);
 
// 

return  Column(
  children:<Widget> [
        ListTile(
    
     
    
                             
    
                            leading:CircleAvatar(radius:20.0,
    
                            backgroundImage: userimage==null?AssetImage("images/default-profile-picture.jpg"):NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$userimage"),
    
                             ),
    
                             title:Column(
                               children:<Widget> [
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children:<Widget> [
                                     Row(
                                       children:<Widget> [
                                         Container(
                                          
                                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
    
                                           child: FlatButton(onPressed: (){
    
                                             if(id==com_user)
    
                                            { Navigator.of(context).push(MaterialPageRoute(
    
                                               builder: (context){
    
                                                   return Socialbasic(4);
    
                                               }));}
    
                                               else
    
                                               {
    
                                                 Navigator.of(context).push(MaterialPageRoute(
    
                                               builder: (context){
    
                                                   return FrendPage(com_user,username,postid,"comment","");
    
                                               }));
    
                                               
    
                                               } 
    
                                               
    
                                               }, 
    
                                           child: Text(username),),
    
                                         ),
                                       ],
                                     ),
                                      if( com_user == id)IconButton(
                                icon: Icon(SimpleLineIcons.options),
                                onPressed: () {
                                 
                                  {showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset(com_id)));}
                                },
                              ),
                                   ],
                                 ),
                               ],
                             ),
    
                             subtitle: Container(
    
                              // width:MediaQuery.of(context).size.width,
    
                               color:Colors.grey[100],
    
                               padding: EdgeInsets.all(5),
    
                               margin:EdgeInsets.only( right: 47),
    
                               child: Column(
    
                                    crossAxisAlignment: CrossAxisAlignment.start,
    
                                    children: <Widget>[ 
    
                                     
    
                                      Text(comment ,maxLines: comnts[cid].getmoref()?1000:4,textAlign: TextAlign.end,),
    
                                 
    
                                
    
                                InkWell(
    
                    onTap: (){  setmore(cid); },
    
                    
    
                    child: Container(
    
                      
    
                      child: Row(
    
                        
    
                        mainAxisAlignment: MainAxisAlignment.start,
    
                        children: <Widget>[
    
                           
    
                         comnts[cid].getmoref() ? Text("Show Less",style: TextStyle(color: Colors.grey),) :  Text("Show More",style: TextStyle(color: Colors.grey)),
    
                       
    
                       
    
                        ],
    
                      ),
    
                       
    
                    ),
    
                  ) 
    
                  ]), 
    
                          )),
  ],
);
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
                   comnts.remove("");
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
                  margin:EdgeInsets.only(  left:55),
                child: Row(
                   children:<Widget> [Text("Comment",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 25.0)),
                     Container(
                  height: 400,
                  width: 50,
                  child: new FlareActor(
                    "assets/success-1.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ), 
                   ] ) ),
            ) ),
          body: Stack(children: <Widget>[
           Container(color:Colors.white,
           height:MediaQuery.of(context).size.height,
           width:MediaQuery.of(context).size.width,
           ),
           Positioned(
             bottom:0,
             child: Container(
             color:Colors.white,
             height:60,
             width:MediaQuery.of(context).size.width,
             child:Column(children:<Widget>[
                Row(children: <Widget>[
                  
                 Container(
                   decoration: BoxDecoration(border:Border(top:BorderSide(color:Colors.grey))),
                   padding: EdgeInsets.symmetric(horizontal:5,vertical: 5),
                   width:MediaQuery.of(context).size.width ,
                 child: TextFormField(
                   controller: addcomment,
                   decoration: InputDecoration(
                     hintText: "add comment",
                     filled:true,
                     fillColor: Colors.grey[200],
                     suffixIcon: IconButton(icon:Icon(Icons.send,),
                     onPressed:(){
                       addComment();
                       print ("seeeeeeeeeeeeeeeeeeeeeeeeeeend");
                     }  ),
                     contentPadding:EdgeInsets.all(5),
                     focusedBorder:OutlineInputBorder(borderRadius :BorderRadius.circular(60)),
                     enabledBorder:OutlineInputBorder(borderRadius :BorderRadius.circular(60)),

                       errorBorder: InputBorder.none,
                       
                       disabledBorder: InputBorder.none,
                       ),
                       
                   ),
                 )]),
                 // 
                ],
                )

          )
          ),
          Positioned(top: 20,
          
          child: Container( 
            width:MediaQuery.of(context).size.width , 
            height:MediaQuery.of(context).size.height-170 ,
            child:SingleChildScrollView(
              child:FutureBuilder(
                future:getcomments() ,
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
                 for(int g=0;g<=snapshot.data.length;g++)
                {
                  comnts.add(Com.fromsnapshot(snapshot.data[i]));
                 
                  }
                  //comnts.insert(i,Com( com_id: snapshot.data[i]['com_id'],));
                  for(int g=0;g<=snapshot.data.length;g++)
                {
                  comnts.forEach((comment) {comment.seticmid(snapshot.data[i]['com_id']);} );
                 
                  }
                 
                  print(snapshot.data[i]['com_id']);
                  print(snapshot.data.length);
                  /* print(snapshot.data[i]['com_id'])  ;
                    print(snapshot.data[i]['comment'])  ; */

                  return  getcomment(
                          snapshot.data[i]['com_id'],
                          snapshot.data[i]['username'],
                          snapshot.data[i]['comment'],
                         snapshot.data[i]['com_user'],
                            snapshot.data[i]['user_image'],       
                           

                        );
                                      
                },
              ),
            )
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
           
                              
              )),),)
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
