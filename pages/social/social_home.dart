 

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/children/childfirstpage.dart';
import 'package:wallysprouts/pages/social/addpost.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
import 'package:wallysprouts/pages/social/showvedio.dart';
import 'package:wallysprouts/pages/social/firstpagechate.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/like.dart';
import 'package:wallysprouts/pages/social/liked.dart';
import 'package:wallysprouts/pages/social/chatsystem/chat_main.dart';
import 'package:wallysprouts/pages/social/post.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:wallysprouts/pages/social/story.dart';
import 'package:wallysprouts/pages/social/comment.dart'; 
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallysprouts/pages/social/updatepost.dart';
class Home extends StatefulWidget {
   @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Story> _stories = [
    Story(
        "http://192.168.1.8:8081/WallySprouts/upload/image_picker1353256662.jpg",
        "deaa"),
    Story(
        "http://192.168.1.8:8081/WallySprouts/upload/image_picker482289727.jpg",//http://192.168.1.8:8081/WallySprouts/upload/image_picker482289727.jpg
        "doaa"),
  /*  Story(
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Lavina"),
    Story(
        "https://images.pexels.com/photos/1124724/pexels-photo-1124724.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Mckenzie"),
    Story(
        "https://images.pexels.com/photos/1845534/pexels-photo-1845534.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Buster"),
    Story(
        "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Carlie"),
    Story(
        "https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Edison"),
    Story(
        "https://images.pexels.com/photos/573299/pexels-photo-573299.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Flossie"),
    Story(
        "https://images.pexels.com/photos/756453/pexels-photo-756453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Lindsey"),
    Story(
        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Freddy"),
    Story(
        "https://images.pexels.com/photos/1832959/pexels-photo-1832959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Litzy")*/
  ];
  VideoPlayerController _controller;
  List<Post> posts = [
  /*  Post(
       )*/

       
  ];
   LongPressGestureRecognizer _recogenizer;

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
  
    /* Future deletpost(post_id) async 
  {
 var url = "http://192.168.1.8:8081/WallySprouts/deletepost.php";
   var data={ "post_id":post_id};
   var response = await http.post(url, body: data);
    
  }*/
  Future deletpost(post_id) async {
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/deletepost.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['post_id'] = post_id;

    var response = await request.send();
    if (response.statusCode == 200) {
     // _Alert(context, "Event Deleted");
      print(' Deleted');
      Navigator.of(context).pop(MaterialPageRoute(
      builder:(context)=>Socialbasic(0)));
    } else {
     // _Alert(context, "Event Not Deleted");
      print(' Not Deleted');
    }
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
  /* for (int h = 0; h <likelist.length; h++)
    {
      if(likelist[h]==posts[i])
    }
    } */
  
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
    print("kkkkkkkkkkkkkkkkkkkk");
    getlikes();
     
    refreshkey = GlobalKey<RefreshIndicatorState>();
   
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
 


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
                              onPressed:(){
                                deletpost(post_id);},
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
     iconlikevalue= Icon(FontAwesome.heart,color: Colors.red,);
        });
    }
    else 
    {
       
    setState(() {
       deletlike(k);
      posts[i].seticon(Icon(FontAwesome.heart_o,))  ;
      iconlikevalue= Icon(FontAwesome.heart_o,);
        });
    }
       

  }
  Icon  iconlikevalue; 
  setlikev(postid,postuser)
  {
    int h;
    getlikes();
    int len=likelist.length;
   postid=postid.toString();
   
     for( h =0 ;h<len;h++)
     {  
       if(likelist[h]==postid && likepostlist[h]==id)
       
        {
           setState(() {
            iconlikevalue= Icon(FontAwesome.heart,color: Colors.red,);
          });}
          else setState(() {
            iconlikevalue= Icon(FontAwesome.heart_o,);
          });
  }}
  int h;
  
   Icon likevalue(postid,postuser)
   {int len=likelist.length;
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
 Container getpostlist(String username,String post_user,String caption,String image ,String isvedio,var post_id,String userimage,String subject)
 {
 //print(post_id );
 int pid=int.parse(post_id);
 likevalue(pid,post_user);
  String mimeStr = image;
          var fileType = mimeStr.split('/');
          print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
          print('file type ${fileType}');
           
           _controller=VideoPlayerController.network(
        "http://192.168.1.8:8081/WallySprouts/upload/$image")
             // ..addListener(_onVideoControllerUpdate)
              //..setVolume(1.0)
              ..initialize();
              //..setLooping(true)
             // ..play();
          
  
 
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
                                      image:userimage==null?AssetImage("images/default-profile-picture.jpg"):NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$userimage"), //NetworkImage(image),
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
                                  
                                  {showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset(post_id,caption,subject)));}
                                },
                              ),
                            ],
                          ),
                        ),
                        //image_picker482289727.jpg
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
       Navigator.of(context).push(MaterialPageRoute(
       builder:(context)=> VideoAppsocial (image)));
     
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
                                                             
                                      setlikev(pid,post_user);
                                   },
                                   
                                  icon: //iconlikevalue,
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
                                   Navigator.of(context).push(MaterialPageRoute(
       builder:(context)=> VideoAppsocial (image)));
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
 


    return Scaffold(
      appBar: AppBar(
           // elevation: 30,
            centerTitle: true,
            backgroundColor: Color(0xffffffff),
            leading: IconButton(
                icon: Icon(Feather.camera),
                onPressed: () {
                 // Navigator.of(context).pushNamed('Addpost');
                /* Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return MyHomePage();//Childrenvideos();
                               }));*/
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>MyAppp/*UploadbookAdmin*/ ( )));
                },
                
                color: Colors.black,
                iconSize: 30.0,
                hoverColor: Colors.black),
                actions: <Widget>[
          
          IconButton(
            onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>MyAppchat()));},
            icon: Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          ),
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Text("Wally Sprouts",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0))
                    ),
    body: RefreshIndicator(
      key:  refreshkey,
      onRefresh: (){
        
      },
      child: Container(
      
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),
            
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                vertical: 2,
                
              ),
              
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                            width: 3,
                            color: Color(0xFF8e44ad),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            2,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image:/*AssetImage("images/default-profile-picture.jpg"),*/ NetworkImage(story.image),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(story.name),
                    ],
                  );
                }).toList(),
              ),
            ),

            // posts
            
          // PostList("https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg","Doaa ALkhaldi", "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "amaysing view <3")
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
                                      
                                      snapshot.data[i]['is_vedio'],
                                      // int.parse(snapshot.data[i]['post_id']
                                       snapshot.data[i]['post_id'],
                                       snapshot.data[i]['user_image'],
                                        snapshot.data[i]['post_subject']
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
      ),
      
    ),)
    );
  }
  


}








       
  













