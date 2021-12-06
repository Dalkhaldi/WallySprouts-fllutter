import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/children/childfirstpage.dart';
import 'package:wallysprouts/pages/social/secondpagechat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallysprouts/pages/social/social_basic.dart';
 

class Firstpagechat extends StatefulWidget {
   

   @override
  _FirstpagechatState createState() => _FirstpagechatState( );
}

class _FirstpagechatState extends State<Firstpagechat> {

  
   var user = "";
  var email = "";
  var id;

/*List<dynamic> listuser = [];
  Future viewusers() async {
    print("heeeeeer");
    var data = { "id": id,};
    var url = "http://192.168.1.8:8081/WallySprouts/allforchat.php";
    var response = await http.post(url, body: data);
    
    var responsebody = json.decode(response.body);
    
    for (int i = 0; i < responsebody.length; i++) {
      listuser.add(responsebody[i]['username']);
    }
    
    print(listuser);
    return responsebody;
  }*/
  Future viewusers() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allforchat.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    print(responcebody);
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
       viewusers();
    });
  }
 

  Container users(String username,String userid,String image){
    print(username);
   
      return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: true//chat.unread
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                            // shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          )
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:  image==null?AssetImage("images/default-profile-picture.jpg"):NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$image"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                           onTap: (){
                             
                              Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return ChatScreen(userid,id,image,image);
                               }));
                               
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
                                true
                                    ? Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    : Container(
                                        child: null,
                                      ),
                              ],
                            ),
                            Text(
                              "10:30",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "chat.text",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
            
  }
  @override
  void initState() {
    getpref();
    //viewusers();
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  
                                Navigator.of(context).pop(MaterialPageRoute(
                                  builder:(context)=>Socialbasic(0)));
                },
                
                color: Colors.black,
                iconSize: 30.0,
                hoverColor: Colors.black),
          actions: <Widget>[
             
            
          ],
          backgroundColor: Colors.white,
        ),
         
        body: Column(
          children:<Widget>[
             SizedBox(
                 height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
       
      decoration:BoxDecoration( 
           
          border: Border.all(color:Colors.grey,
          width:2.0),
       borderRadius: BorderRadius.all(Radius.circular(5),)
       
      ),
       
       child:Container(
           
           height: 35,
          child: TextField(
            decoration: InputDecoration(
              
          hintText: "Search acounts",
          border: InputBorder.none,
          icon: Icon(Icons.search,color: Colors.black,),
          ),
          textCapitalization: TextCapitalization.sentences,
       ))
     ),
                ),
      
     /* Divider(
                  color: Colors.black38,
                ),*/
                Positioned( 
                                        child: Container(
                                           width:MediaQuery.of(context).size.width , 
            height:MediaQuery.of(context).size.height-155,
                       
                       child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               
                FutureBuilder(
                future:viewusers() ,
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
                      
                  return  users(
                            snapshot.data[i]['username'],
                            snapshot.data[i]['id'],
                            snapshot.data[i]['user_image'],
                            
                            
                           
                                    
                             

                          );
                                        
                },
              ),
            ),
                          
          ],);}
          return Center( );
           }
           
                                
              )
               
              /*  ListView.builder(
                       itemCount: 6,//chats.length,
                       itemBuilder: ( context, i) {
                  return users("deaa","4","");
                
              
                }
                
                
            )*/],
            ),
          ),
                     ),
                   ),
            ]  ),
      ),
    );
  }
}