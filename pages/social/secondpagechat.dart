import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallysprouts/pages/social/firstpagechate.dart';

class ChatScreen extends StatefulWidget {
  String  user1id;
  String  user2id;
  String user1image;
  String user2image;
  ChatScreen(this.user1id,this.user2id,this.user1image,this.user2image);

  @override
  _ChatScreenState createState() => _ChatScreenState(user1id,user2id,user1image,user2image);
}

class _ChatScreenState extends State<ChatScreen> {
   
   String  user1id;
  String  user2id;
  String user1image;
  String user2image;
   _ChatScreenState(this.user1id,this.user2id,this.user1image,this.user2image);
    final msgsend = TextEditingController() ;
    final ScrollController _controller = ScrollController();
int g;
   var user = "";
  var email = "";
  var id;
    List<dynamic> msgs = [];
  Future getmsgs() async {
  
    var url = "http://192.168.1.8:8081/WallySprouts/allmsgs.php";
   var data={"user1id":user1id,"user2id":user2id};
    var response = await http.post(url, body: data);
    var responcebody= json.decode(response.body);
    print("ggggggggggggggggggggggg");
    print(responcebody);
    return responcebody;
    }
    setg()
    {
      setState(() {
        g=g+1;
      });
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
       //viewusers();
    });
  }
   @override
  void initState() {
    getpref();
    getmsgs(); 
   
    super.initState();
  }
  @override
  void dispose() {
    msgsend.dispose();
    _controller.dispose();
    super.dispose();
  }
  _chatBubble(String message, bool isMe, bool isSameUser,time) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            
            alignment: Alignment.topRight,
            child: Container(
              
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff01a3a4),
                borderRadius: BorderRadius.circular(15),
                
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
               message,///msge text
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      time,///msge time
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
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
                        radius: 15,
                        backgroundImage:  user1image==null?AssetImage("images/default-profile-picture.jpg"):NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$user1image"),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message,///msge text
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
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
                        radius: 15,
                        backgroundImage: user1image==null?AssetImage("images/default-profile-picture.jpg"):NetworkImage("http://192.168.1.8:8081/WallySprouts/upload/$user1image"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          
          Expanded(
            child: TextField(
              controller: msgsend,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setg();
              _chatBubble(msgsend.text , true,false,"10:30");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500),
        () => _controller.jumpTo(_controller.position.maxScrollExtent));
    String prevUserId;
    String message;
    bool isMe;
    bool isSameUser;

    return Scaffold(
     // backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff01a3a4),
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: "widget.user.name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(text: '\n'),
             true ?///is online
              TextSpan(
                text: 'Online',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
              :
              TextSpan(
                text: 'Offline',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Firstpagechat();
                               }));
            }),
      ),
      body: FutureBuilder(
                future: getmsgs(),
             builder: (BuildContext context,AsyncSnapshot snapshot ){
                
               if(snapshot.hasData)
                    {
                       g=snapshot.data.length;
              return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _controller,
                reverse: true,
                padding: EdgeInsets.all(20),
               itemCount:g, //snapshot.data.length,
                itemBuilder: (context, i) {
                    message = snapshot.data[i]['text'];
                    isMe = snapshot.data[i]['user1id'] == id;
                    isSameUser = prevUserId == snapshot.data[i]['user1id'];
                  prevUserId = snapshot.data[i]['user1id'];
                  return _chatBubble(message , isMe,isSameUser,snapshot.data[i]['date']);
                },
              ),
            ),
            _sendMessageArea(),
          ],
        );}
         return Center(
                 
               child:CircularProgressIndicator(),
                
               );
             }
      ),
    );
  }
}