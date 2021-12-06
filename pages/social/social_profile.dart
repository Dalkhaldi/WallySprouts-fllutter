 

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/social/containt.dart';
import 'package:wallysprouts/pages/social/edit_profile.dart'; 
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/social/coper.dart';
import 'package:wallysprouts/pages/social/newPost.dart';
import 'package:wallysprouts/pages/social/pageroute.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:wallysprouts/pages/social/vedioplay.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
var cont;
class _ProfilePageState extends State<ProfilePage> {
     
  @override
  void initState() {
     getpref();
     getData();
   // getpost();
    super.initState();
     
  }
   var user = "";
  var email = "";
  var id;
  var responsebody1;
 
    /* Future getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allpost.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    return responcebody;
    }*/ 
    String userimage;
    String bio;
    List<dynamic> listsearch = [];
   getData() async {
    var url1 = "http://192.168.1.8:8081/WallySprouts/profiledata.php";
    var data = {"id": id};
    var response1 = await http.post(url1, body: data);
     responsebody1 = json.decode(response1.body);
    print(responsebody1);
    
      userimage=responsebody1['user_image'];
      print("imaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaage");
     // print(userimage);
      bio=responsebody1['Bio'];
     // print(bio);
    //data(responsebody1['user_image'],responsebody1['Bio']);
    }
  
     
    String about;
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
      // getData();
    });
  }
 int postnum;
    Future getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/profilepost.php";
     var data = {"id": id};
    var response = await http.post(url,body: data);
    var responcebody= json.decode(response.body);
     postnum=responcebody.length;
    return  responcebody;
     
    }
  Widget buttonset(post_id)
     {
       return  Container(
            
           height:160,
           //Color(0xf00cec9) ,
           width:MediaQuery.of(context).size.width,
           margin:EdgeInsets.symmetric(
             horizontal:20,
             vertical:20
             
           ),
            
          
           child: Column(
             children: <Widget>[
               Text(
                 "Change Post details",
                 style: TextStyle(
                   fontFamily: 'DancingScript',
                   fontSize: 20
                 ),
                 
               ),
               Divider(color: Colors.black,thickness:0.2),
               
                   FlatButton(onPressed: (){ }, child: Text("Update Post" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
               // Divider(color: Colors.black,thickness:0.2),
              Divider(color: Colors.black,thickness:0.2),
               
                   FlatButton(onPressed: (){ 
                   showDialog(
                     context: context,
                     builder: (context){
                       return AlertDialog(
                         title: Text("Delete Post!"),
                         content: Text("Are you sure you want to delete the Post"),
                         actions:<Widget> [
                            FlatButton(
                              child:Text("Yes"),
                              onPressed:(){/*deletpost(post_id);*/},
                            ),
                            FlatButton(
                              child:Text("No"),
                              onPressed:(){Navigator.of(context).pop(MaterialPageRoute(
                                  builder:(context)=>Socialbasic(0)));},
                            ),

                         ],
                       );
                     }
                     
                   );


                   }, child: Text("Delete Post" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
                
               
             ],

           ),
           
         );
       

     }
  

    
     
   // userimae=response['user_image'];
       // bio=response['Bio'];
     
    
  

  final List<String>alb=["Privacy","Public Account","Private Account",];
    String selectedalb ="Privacy";
    setprivecy( String value){
  
      setState(() {
                    selectedalb = value;
                     print(selectedalb);
                  });}
  Positioned data(userimage,bio){
   // getpref();
 return             
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
                     onPressed: () {},
                     icon: Icon(Icons.add,size: 30,),
                                    ),
                   
                DropdownButton<String>(
                  value: selectedalb,
                   onChanged: (value){
                    setprivecy(value);
                     
                  },
                  items: alb.map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem(
                      child:Text(value),
                      
                      value: value,
                      
                      );
                      
                  }).toList(),
                 
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
              _getAvatar( userimage),
              SizedBox(height: 2),
              Text(
                user,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(bio, style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              _getUserStats(postnum),
              SizedBox(
                height: 1,
              ),
              _getUserBtns(userimage,bio,user),
            ],
          ),
    ),
  ); 
  }
  List list;
  @override
  Widget build(BuildContext context) {
   
    
  
    cont =context;
    int count;
    return Scaffold(
              
      backgroundColor: Colors.white,
      body:  Stack(
           
          
            children: <Widget>[
              /*for(int i=0;i<=10;i++)
              
                 Center(
                 
               child:CircularProgressIndicator(),
                
               ),*/
//////////////////////////////////////////////////////////////
///postList
Container(
    color: Colors.grey.withOpacity(0.0),
    
    child: Container(
                       
                    child: FutureBuilder(
                      future: getpost(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ?  new GridView.builder(
                               padding:  EdgeInsets.fromLTRB(10, 365, 10, 90),
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                               
                                 
                                     
                                  
                                   
                                 
                                itemBuilder: (context, index) {
                                   list = snapshot.data;
                                  // postnum=list.length;
                                  return RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Routpage(
                                             "posts",
                                             list[index]['username'],
                                             list[index]['post_user'],
                                             list[index]['caption'],
                                             list[index]['image'],
                                              list[index]['is_vedio'],
                                               list[index]['post_id'],
                                                list[index]['user_image'],
                                                list[index]['post_subject'],
                                               
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'logo$index',
                                      child: Container(
                                       /* height: MediaQuery.of(context).size.width * 0.1,
                                        width: MediaQuery.of(context).size.width * 0.1,*/
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image:list[index]['is_vedio']=='i'? NetworkImage(
                                              "http://192.168.1.8:8081/WallySprouts/upload/${list[index]['image']}",
                                            ):AssetImage("images/video.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                 
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
  ),

///////////////////////////////////////////////////////////////////
               
              
               
             // _getPostsList(context),
               
             // data(),
             FutureBuilder(
             future: getData(),
             builder: (BuildContext context,AsyncSnapshot snapshot ){
              
               
              if( userimage!= null)
              {
               return data( 
                 userimage,
                  bio,
               ); 
              }
               
              else  return Center(
                 
               child:CircularProgressIndicator(),
                
               );

               
              
            
                 
              
             
              } ),
             // _getHeader(context),
              _getBottomBarShadow(context),
               
            ],
          
    
        ),
            /* FutureBuilder(
             future: getpost(),
             builder: (BuildContext context,AsyncSnapshot snapshot ){
                 if (snapshot.hasError) print(snapshot.error);
               if(snapshot.hasData)
                    {
               return Column(
                 children:<Widget>[
                        Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                   
               /* for(int g=0;g<=snapshot.data.length;g++)
                {  
                 if( snapshot.data[i]['user_id']==id)
                
                    {  */  
                  return getdataprof(
                                       snapshot.data[i]['user_image'],
                                       snapshot.data[i]['Bio'],
                                       
                                      
                                       
                    );
                 /*   }
                    else
                     continue;*/
                                      
                },
              ),
            )
                 ]
               );}
               return Center(
                 
               child:CircularProgressIndicator(),
                
               );
             }
             ),*/
            
          
      
      );
      
    
    
  }
}


 

_getUserBtns(userimage,bio,user) {
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
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  onPressed: () {
                     Navigator.of(cont).push(MaterialPageRoute(
     builder:(context)=>Editprofile (userimage,user,bio)));
                  }),
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

_getUserStats(postnum) {
  String numb=postnum.toString();
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
              Text(numb),
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
              Text('3'),
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

_getAvatar( userimage) {
  print(userimage);
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
        backgroundImage:userimage==null? AssetImage("images/default-profile-picture.jpg"):
        NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$userimage"),
        radius: 30,
      ),
    ],
  );
}

/*_getPostsList(context) {
  
  return Container(
    color: Colors.grey.withOpacity(0.0),
    /*
    child: GridView.count(
      padding: EdgeInsets.fromLTRB(10, 365, 10, 90),
      crossAxisCount: 3,
      
      children: <Widget>[
        
       // _getPost(context: context, image: AssetImage('assets/first.jpg')),
        _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker60197789.jpg")),
       // _getPost(context: context, image: AssetImage('assets/third.jpg')),
        //_getPost(context: context, image: AssetImage('assets/fourth.jpg')),
        _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker388351922.jpg")),
        _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_cropper_1604930321106.jpg")),
        _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/image_picker845068222.jpg")),
         _getPost(context: context, image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/110210748_762928847778533_2807216206214528604_n.mp4")),
      ],
    ),*/
    
}*/

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
 
 

 