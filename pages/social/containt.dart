import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/social/addpost.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
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
class Containt extends StatefulWidget {
    
   String title;
   Containt(this.title);

  @override
  _ContaintState createState() => _ContaintState(title);
}
class _ContaintState extends State<Containt> {

  String title;
   _ContaintState(this.title);
  
  VideoPlayerController _controller;
  List<Post> posts = [
  /*  Post(
       )*/
  ];

  
    bool heart= true;
     var user = "";
  var email = "";
  var id;
  GlobalKey<RefreshIndicatorState>refreshkey;
  
  
     Future getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allpost.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    return responcebody;
    }
   
    Future addlike(post_id) async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/setlike.php";
   var data={"likeuser":id,"likepost":post_id};
    var response = await http.post(url, body: data);
    
  }
  List<dynamic> likelist = [];
 List<dynamic> likepostlist = [];
   
   Future getlikes() async {
  
    var url = "http://192.168.1.8:8081/WallySprouts/getlikeshome.php";
   //var ;
    var response = await http.post(url);
    var responcebody= json.decode(response.body);
    //return responcebody;
    for (int i = 0; i < responcebody.length; i++) {
      likelist.add(responcebody[i]['like_post']);
      likepostlist.add(responcebody[i]['like_user']);

    }
    print(likelist);
    print(likepostlist);

    }


    Future deletpost(post_id) async {
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/deletepost.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['post_id'] = post_id;

    var response = await request.send();
    if (response.statusCode == 200) {
     // _Alert(context, "Event Deleted");
      print(' Deleted');
    } else {
     // _Alert(context, "Event Not Deleted");
      print(' Not Deleted');
    }
  }
   Future deletlike(post_id) async {
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/unsetlike.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['likeuser'] =  id;
    request.fields['likepost'] = post_id;

    var response = await request.send();
    if (response.statusCode == 200) {
     // _Alert(context, "Event Deleted");
      print(' Deleted');
      
    } else {
     // _Alert(context, "Event Not Deleted");
      print(' Not Deleted');
    }
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
  
  @override
  void initState() {
    getpref();
    getpost();
    //getlikes();
     
    refreshkey = GlobalKey<RefreshIndicatorState>();
   
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    if(_controller!=null)
    _controller.dispose();
  }
//Icon ic =Icon(FontAwesome.heart_o,);
int i;
String k;
/*setLike(i) 
{  

   if(!heart)
   {
     heart=true;
    setState(() {
     // addlike(k);
     posts[i].seticonheart(Icon(FontAwesome.heart,color: Colors.red,))  ;
        });
    }
    else 
    {
       heart=false;
    setState(() {
      posts[i].seticonheart(Icon(FontAwesome.heart_o,color:Colors.white))  ;
        });
    }

  } */
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
                                  builder:(context)=> Newpostupdate(subject,caption,post_id))); }, 
                                  child: Text("Update Post" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
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
setLike(i,post_user) 
{  
  getlikes();
k=  i.toString();
   heart=!heart;
   if(heart)
   {
      
    setState(() {
      addlike(k);
     posts[i].seticon(Icon(FontAwesome.heart,color: Colors.red,)) ;
        });
    }
    else 
    {
       
    setState(() {
       deletlike(k);
      posts[i].seticon(Icon(FontAwesome.heart_o,))  ;
        });
    }
       

  }
  int h;
  Icon  iconlikevalue; 
   Icon likevalue(postid,postuser)
   {
     int len=likelist.length;
   postid=postid.toString();
   
     for( h =0 ;h<len;h++)
     {  
       if(likelist[h]==postid && likepostlist[h]==id)
       
        {
         
       
       iconlikevalue=Icon(FontAwesome.heart,color: Colors.red,);
         return Icon(FontAwesome.heart,color: Colors.red,);
        }
     
   
   }
      
     iconlikevalue=Icon(FontAwesome.heart_o,);
      return Icon(FontAwesome.heart_o,);}
  setlikev(i)
  {
         if(i) setState(() {
            iconlikevalue= Icon(FontAwesome.heart,color: Colors.red,);
          });
          else setState(() {
            iconlikevalue= Icon(FontAwesome.heart_o,);
          });
  }
   Container getpostlist(String username,String post_user,String caption,String image,String subject ,String isvedio,var post_id,userimage )
 {
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
          
      if(subject==title)
      {
           
       
 int pid=int.parse(post_id);
   return Container(
                     color: Color.fromRGBO(49, 48, 49, 1.0),
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
                                    post_user ==id ?
                                   Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>Socialbasic(4)))
      
                                   
                                    
                                 : Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>FrendPage(post_user,username,post_id,"containt",title)));
                                   
                                          },
                                  child: Text(username ,style:TextStyle(color:Colors.grey,fontSize: 15.0, ))
                                    ),
                                  
                                ],
                              ),
                              if( post_user == id) IconButton(
                                icon: Icon(SimpleLineIcons.options,color: Colors.white,),
                                onPressed: () {showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset(post_id,caption,subject)));},
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
                  child: VideoPlayer(_controller),
                   
                ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                                                
                                     setLike(pid,post_user);
                                   },
                                   
                                  icon: 
                                  likevalue(pid,post_user),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //var idp = post_user.toString();
                             Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(post_id);
                               }));


                                  },
                                  icon: Icon(FontAwesome.comment_o,color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesome.send_o,color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                  //lpsae0dcKBtc44NN9roC     me
                                  //8vU5GJR7EOYGDGGS2919     other
                              },
                              icon: Icon(FontAwesome.bookmark_o,color: Colors.white),
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
                    style: TextStyle(color: Colors.white,fontSize: 16),
                    children: [
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),
                      ),
                      TextSpan(
                        text: 'others',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),
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
                                      color: Colors.grey),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: caption,
                                  style: TextStyle(color: Colors.white),
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
                  );}
                  else{
                    return Container();
                  }
 }
  @override
  Widget build(BuildContext context) {


//signin
    return Scaffold(
       backgroundColor:Color.fromRGBO(49, 48, 49, 1.0),
      appBar: AppBar(
           // elevation: 30,
            centerTitle: true,
            backgroundColor: Color.fromRGBO(49, 48, 49, 1.0),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                   builder:(context)=> Socialbasic(1)));
                },
                
                color: Colors.white,
                iconSize: 30.0,
                hoverColor: Colors.black),
                actions: <Widget>[
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0))
                    ),
                    body: Container(
      
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),
            
            
            FutureBuilder(
             future: getpost(),
             builder: (BuildContext context,AsyncSnapshot snapshot ){
                
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
                   
                for(int g=0;g<=snapshot.data.length;g++)
                { posts.add(Post.fromsnapshot(snapshot.data[i]));}
                          
                  return getpostlist(
                                       snapshot.data[i]['username'],
                                       snapshot.data[i]['post_user'],
                                      snapshot.data[i]['caption'],
                                      snapshot.data[i]['image'],
                                       snapshot.data[i]['post_subject'],
                                      snapshot.data[i]['is_vedio'],
                                      
                                      // int.parse(snapshot.data[i]['post_id']
                                       snapshot.data[i]['post_id'],
                                       snapshot.data[i]['user_image'],
                                        
                    );
                                      
                },
              ),
            )
                 ]
               );}
               return Center(
                 
               child:CircularProgressIndicator(),
                
               );
             }
             ),
            
          ],
        ),
      )));
      
            
           // posts
            
         
  }
}