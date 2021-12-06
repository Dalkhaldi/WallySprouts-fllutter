 

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallysprouts/pages/social/comment.dart';
import 'package:wallysprouts/pages/social/containt.dart';
import 'package:wallysprouts/pages/social/liked.dart';
import 'package:wallysprouts/pages/social/social_basic.dart'; 

class FrendPage extends StatefulWidget {
  String userid;
   String username;
    String idpost;
   String page;
   String title;
    
  FrendPage(this.userid,this.username,this.idpost,this.page,this.title);
  @override
  _FrendPageState createState() => _FrendPageState(userid,username,idpost,page,title);
}
var cont;
class _FrendPageState extends State<FrendPage> 
{

  String userid;
 String  username;
  String idpost;
 String page;
 String title;
  _FrendPageState(this.userid,this.username,this.idpost,this.page,this.title);
  String userimage="images/default-profile-picture.jpg";
  @override
  Widget build(BuildContext context) {
    
  
     
    cont =context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
       
    
        children: <Widget>[
          _getPostsList(context),
           Positioned(
    top: 0,
    child: Container(
      
      padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
      height: 369,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 15,
                offset: Offset(0, 6))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                 onPressed: () {
                   if(page=="home") 
                  { Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>Socialbasic(0)));}
               else if(page=="like")
               {
                 Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>Liked(idpost)));
               }
               else if(page=="comment")
               {
               Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>Comment(idpost)));
               }
                else if(page=="containt")
               {
               Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>Containt(title)));
               }
               },
                 icon: Icon(Icons.arrow_back_ios,size: 30,),
                                ),
               
            
              
          
              IconButton(
                 onPressed: () {},
                 icon: Icon(Icons.more_horiz,size: 30,),
                                ),
            ],
          ),
          SizedBox(
            height: 0,
          ),
          _getAvatar(),
          SizedBox(height: 2),
          Text(
            username,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text('Hey', style: TextStyle(fontSize: 14)),
          SizedBox(height: 10),
          _getUserStats(),
          SizedBox(
            height: 1,
          ),
          _getUserBtns(),
        ],
      ),
    ),
  ),
         // _getHeader(context),
          _getBottomBarShadow(context),
           
        ],
      
    ));
  }
}



_getUserBtns() {
   
   
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
       /*decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.orange.shade400, Colors.pink]),
            borderRadius: BorderRadius.circular(10)),*/
       child: RaisedButton(
                  color: Color(0xff01a3a4),
                   highlightColor:Colors.white,
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  onPressed: () {
                   /*  Navigator.of(cont).push(MaterialPageRoute(
                     builder:(context)=>Containt ("edit")));*/
                  }),
               /* child: FlatButton(onPressed: (){

                }, 
                  color: Color(0xff01a3a4),
                  highlightColor: Colors.grey,
                  child: Text("Follow",
                  style:TextStyle(
                  color:Colors.white ,fontSize: 15.0, ))
        ),*/
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
        /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300),*/
        child: IconButton(
        onPressed: () {},
       icon: Icon(FontAwesome.send_o),
        ),
      )
    ],
  );
}

_getUserStats() {
  return Row(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(right: BorderSide(color: Colors.grey, width: 0.4))),
          child: Column(
            children: <Widget>[
              Text('1'),
              FlatButton(onPressed: null, child: Text("Post" ,style:TextStyle(color:Colors.grey,fontSize: 12.0, ))
        ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(right: BorderSide(color: Colors.grey, width: 0.5))),
          child: Column(
            children: <Widget>[
              Text('5'),
              FlatButton(onPressed: null, child: Text("Followers" ,style:TextStyle(color:Colors.grey,fontSize: 12.0, ))
        ),
            ],
          ),
        ),
      ),
      
      Expanded(
        child: Column(
          children: <Widget>[
            Text('1'),
            FlatButton(onPressed: null, child: Text("Following" ,style:TextStyle(color:Colors.grey,fontSize: 12.0, ))
        ),
          ],
        ),
      ),
    ],
  );
}

_getAvatar() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: <Widget>[
      Container(
        width: 73,
        height: 73,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.orange.shade400, Colors.pink]),
            borderRadius: BorderRadius.circular(50)),
      ),
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
      ),
      CircleAvatar(
        backgroundImage:AssetImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker482289727.jpg"),
        radius: 30,
      ),
    ],
  );
}

_getPostsList(context) {
  return Container(
    color: Colors.grey.withOpacity(0.0),
    child: GridView.count(
      padding: EdgeInsets.fromLTRB(10, 365, 10, 90),
      crossAxisCount: 3,
      children: <Widget>[
       // _getPost(context: context, image: AssetImage('assets/first.jpg')),
       // _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker1370006179.jpg")),
       // _getPost(context: context, image: AssetImage('assets/third.jpg')),
        //_getPost(context: context, image: AssetImage('assets/fourth.jpg')),
        //_getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker222966196.jpg")),
        _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_cropper_1604335316306.jpg")),
      ],
    ),
  );
}

_getPost({context, ImageProvider image}) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
          ),
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}

_getBottomBarShadow(context) {
  return Positioned(
    bottom: 0,
    child: Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.grey.withOpacity(0.6),
            Colors.grey.withOpacity(0.06),
          ])),
    ),
  );
}