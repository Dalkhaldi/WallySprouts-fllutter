import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/children/childfirstpage.dart';
import 'package:wallysprouts/pages/social/addpost.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
import 'package:wallysprouts/pages/social/firstpagechate.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/like.dart';
import 'package:wallysprouts/pages/social/liked.dart';
import 'package:wallysprouts/pages/social/post.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:wallysprouts/pages/social/story.dart';
import 'package:wallysprouts/pages/social/comment.dart'; 
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallysprouts/pages/social/updatepost.dart';

class Routpage extends StatefulWidget {
    
   String title;
   String username;
   String post_user;
   String caption;
   String image ;
   String isvedio;
   var post_id;
   String userimage;
   String subject;
   Routpage(this.title,this.username,this.post_user,this.caption,this.image,this.isvedio,this.post_id,this.userimage,this.subject);

  @override
  _RoutState createState() => _RoutState(title,username,post_user,caption,image,isvedio,post_id,userimage,subject);
}
class _RoutState extends State<Routpage> {

  String title;
  String username;
   String post_user;
   String caption;
   String image ;
   String isvedio;
   var post_id;
   String userimage;
   String subject;
   _RoutState(this.title,this.username,this.post_user,this.caption,this.image,this.isvedio,this.post_id,this.userimage,this.subject);
   
   VideoPlayerController _controller;
    var user = "";
  var email = "";
  var id;
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
   
     Future addlike(post_id) async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/setlike.php";
   var data={"likeuser":id,"likepost":post_id};
    var response = await http.post(url, body: data);
    
  }
  
     Future deletpost(post_id) async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/setlike.php";
   var data={ "post_id":post_id};
   var response = await http.post(url, body: data);
    
  }
   List<Post> posts = [
  /*  Post(
       )*/
  ];
   
  List<dynamic> likelist = [];
   
   Future getlikes() async {
  
    var url = "http://192.168.1.8:8081/WallySprouts/getlikeshome.php";
   //var ;
    var response = await http.post(url);
    var responcebody= json.decode(response.body);
    //return responcebody;
    for (int i = 0; i < responcebody.length; i++) {
      likelist.add(responcebody[i]['like_post']);
    }}
   Widget buttonset(post_id,caption,subject)
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
               
                   FlatButton(onPressed: (){print(caption);
                   print("loooooooool");
                     Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=> Newpostupdate(subject,caption,post_id))); }, child: Text("Update Post" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
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
                              onPressed:(){deletpost(post_id);},
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
     bool heart= false;
//Icon ic =Icon(FontAwesome.heart_o,);
String k;
 Icon like =Icon(FontAwesome.heart_o,);
setLike(i) 
{  
k=  i.toString();
   heart=!heart;
   if(!heart)
   {
      
    setState(() {
      addlike(k);
     posts[i].seticon(Icon(FontAwesome.heart,color: Colors.red,)) ;
        });
    }
    else 
    {
       
    setState(() {
      posts[i].seticon(Icon(FontAwesome.heart_o,))  ;
        });
    }
       

  } //signin
   
    @override
  void initState() {
    getpref();
    //getpost();
    //getlikes();
     
    //refreshkey = GlobalKey<RefreshIndicatorState>();
   
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
 
 Container getpostlist(String username,String post_user,String caption,String image ,String isvedio,var post_id,subject)
 {
 //print(post_id );
  String mimeStr = image;
          var fileType = mimeStr.split('/');
          print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
          print('file type ${fileType}');
           
           _controller=VideoPlayerController.network(
        "http://192.168.1.8:8081/WallySprouts/upload/$image")
             // ..addListener(_onVideoControllerUpdate)
              ..setVolume(1.0)
              ..initialize();
              //..setLooping(true)
             // ..play();
          
  
 int pid=int.parse(post_id);
   return Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image(
                                      image:NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$userimage"), //NetworkImage(image),
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                   FlatButton(
                                   onPressed: (){
                                   if( post_user == id)
                                  { Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>Socialbasic(4)));
      
                                   }
                                   else{
                                  Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>FrendPage (post_user,username,post_id,"home","")));
                                   }
                                          },
                                  child: Text(username ,style:TextStyle(color:Colors.grey,fontSize: 15.0, ))
                                    ),
                                  
                                ],
                              ),
                             if( post_user == id) IconButton(
                                icon: Icon(SimpleLineIcons.options),
                                onPressed: () {
                                  if( post_user == id)
                                  {showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset(post_id,caption,subject)));}
                                },
                              ),
                            ],
                          ),
                        ),
                        
                       isvedio =="i"? FadeInImage(
                          image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$image"),
                          placeholder: AssetImage("images/placeholder.png"),
                         width: MediaQuery.of(context).size.width,
                        )
                        :AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  //child: VideoPlayer(_controller),
                  child: GestureDetector(
    onTap: () {
      if (!_controller.value.isPlaying) {
         setState(() {});
         _controller.initialize();
      }
    },
    child: VideoPlayer(_controller),
  ),
                   
                ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                                                
                                      setLike(pid);
                                   },
                                   
                                  icon: Icon(FontAwesome.heart_o,),//posts[pid].geticon(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //var idp = post_user.toString();
                             Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(post_id);
                               }));


                                  },
                                  icon: Icon(FontAwesome.comment_o),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesome.send_o),
                                ),
                              ],
                            ),
                            isvedio =="v"?  FloatingActionButton(
                              heroTag: "$username",
                              onPressed: () {
                                   setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          
                              },
                              child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
                            )): IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesome.bookmark),
                                ),
                             /* FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),*/
      
    
                          ],
                        ),

                        Row(
                          children:<Widget> [
                            Container(
                             // width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: InkWell(
            onTap: (){
               Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Liked(post_id);
                               }));
            },
                      child: Center(
              child: RichText(
                softWrap: true,
                overflow: TextOverflow.visible,
                text: TextSpan(
                    text: 'Liked By',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                      TextSpan(
                        text: 'others',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),
                      )
                    ]),
              ),
            ),
          ),
                             /* child: RichText(
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                text: 
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Liked By ",
                                      style: TextStyle(color: Colors.black),
                                       
                                    ),
                                   /* TextSpan(
                                      text: "Sigmund,",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " Yessenia,",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " Dayana",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " and",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                       FlatButton(
                                       onPressed: (){
                                       
      
                                       
                                      Navigator.of(context).push(MaterialPageRoute(
                                      builder:(context)=>FrendPage ( username, "images/default-profile-picture.jpg")));
                                       },
                                              
                                      child: Text( "others",style:TextStyle(color:Colors.grey,fontSize: 15.0, ))
                                        ),
                                    ),*/
                                   /* TextSpan(
                                      text: " others",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                          recognizer: _recogenizer
                                    ),*/
                                    
                                  ],
                                  
                                ),
                              ),*/
                              
                            ),
                             
                          ],
                        ),
                        

                        // caption
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 5,
                          ),
                          child: RichText(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: username,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: caption,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // post date
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Febuary 2020",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
           // elevation: 30,
            centerTitle: true,
            backgroundColor: Color(0xffffffff),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                 // Navigator.of(context).pushNamed('Addpost');
                /* Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return MyHomePage();//Childrenvideos();
                               }));*/
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>Welcomechilde/*UploadbookAdmin*/ ( )));
                },
                
                color: Colors.black,
                iconSize: 30.0,
                hoverColor: Colors.black),
                actions: <Widget>[
          
          
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Text("Posts",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0))
                    ),
    body:  Container(
      
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),
            
             

            // posts
            
          // PostList("https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg","Doaa ALkhaldi", "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "amaysing view <3")
                   
                 getpostlist( username,
   post_user,
    caption,
    image ,
    isvedio,
    post_id,
    subject)
                 
            
          ],
        ),
      ),
      
    ));
    
  }}
   
 






