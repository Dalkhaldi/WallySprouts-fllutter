 

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/social/addpost.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/post.dart';
import 'package:wallysprouts/pages/social/story.dart';
import 'package:wallysprouts/pages/social/comment.dart'; 
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatefulWidget {
   @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Story> _stories = [
    Story(
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Jazmin"),
    Story(
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Sylvester"),
    Story(
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
    /*Story(
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

  List<Post> posts = List<Post>();
   
   var user = "";
  var email = "";
  var id;
  GlobalKey<RefreshIndicatorState>refreshkey;
  Future<List<Post>> getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allpost.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    for(var responcebody in responcebody)
    {
           //posts.add(Post.fromsnapshot(responcebody ));
           
           print("addddddddedd");
    }
    return posts;
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
   // getpost();
    getpost().then((value)
              {     setState(() {
                posts.addAll(value);
              });}
               
              );
    refreshkey = GlobalKey<RefreshIndicatorState>();
    super.initState();
  }
  
bool heart= false;
//Icon ic =Icon(FontAwesome.heart_o,);
int i;
 Icon like =Icon(FontAwesome.heart_o,);
 setLike(i) 
{  

   heart=!heart;
   if(!heart)
   {
      
    setState(() {
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
 Column getpostlist( )
 {
   print ("dddldldlddl");
 
 
   return Column(
                 children:<Widget>[
                        Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, i) {
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
                                      image:AssetImage("images/default-profile-picture.jpg"), //NetworkImage(image),
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
        
                                 /* Navigator.of(context).push(MaterialPageRoute(
                                  builder:(context)=>FrendPage ( posts[i].username, "images/default-profile-picture.jpg")));*/
      
                                          },
                                  child: Text(posts[i].username ,style:TextStyle(color:Colors.grey,fontSize: 15.0, ))
                                    ),
                                  
                                ],
                              ),
                              IconButton(
                                icon: Icon(SimpleLineIcons.options),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        FadeInImage(
                          image: NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/${posts[i].image}"),
                          placeholder: AssetImage("images/placeholder.png"),
                         width: MediaQuery.of(context).size.width,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                                                
                                      setLike(i);
                                   },
                                   
                                  icon: posts[i].geticon(),
                                ),
                                IconButton(
                                  onPressed: () {
                                  //  posts.remove('');
                             Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Comment(posts[i].post_id);
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
                            IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesome.bookmark_o),
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          child: RichText(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Liked By ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
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
                                ),
                                TextSpan(
                                  text: " 1263 others",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
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
                                  text: posts[i].username,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: posts[i].caption,
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
                    ),);
                  }))]);
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
                 Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Addpost();
                               }));
                },
                
                color: Colors.black,
                iconSize: 30.0,
                hoverColor: Colors.black),
                actions: <Widget>[
          
          IconButton(
            onPressed: () {},
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
                              image: NetworkImage(story.image),
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
             future: getpost().then((value)
              {     setState(() {
                posts.addAll(value);
              });}
               
              ),
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
                   
                 // print(snapshot.data[i]['image'],);
                 
                          
                  return getpostlist(
                                     
                                     /* posts[i].username, //snapshot.data[i]['username'],
                                       snapshot.data[i]['post_user'],
                                      snapshot.data[i]['caption'],
                                      snapshot.data[i]['image'],
                                      snapshot.data[i]['vedio'],
                                      snapshot.data[i]['is_vedio'],
                                      snapshot.data[i]['post_id']
                                      */);
                                      
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








       
  













