import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/social/coper.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Newpostupdate extends StatefulWidget {
  
  String subjectt;
  String caption;
  String post_id;
  Newpostupdate( this.subjectt,this.caption,this.post_id);

  
   @override
  _NewpostupdateState createState() => _NewpostupdateState(subjectt,caption,post_id);
}

class _NewpostupdateState extends State<Newpostupdate> {
   
  String subjectt;
  String caption;
  String post_id;
   
   final captiontext = TextEditingController();
    
   var user = "";
  var email = "";
  var id;
  _NewpostupdateState( this.subjectt,this.caption,this.post_id);

getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user = preferences.getString("username");
      email = preferences.getString("email");
      id = preferences.getString("id");
     /* print("hhhhhhhhhh");
      print(user);
      print(email);
      print(id);*/
    });
  }
@override
  void initState() {
    getpref();
    print("hhhhhhhhhhh");
     captiontext.text=caption;
     subjectv=subjectt;
   // print(_controller.path);
    super.initState();
    
  }



  Future update() async {
    var pic;
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/updatepost.php");
     var request = http.MultipartRequest('POST',uri);
    
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print(captiontext.text);
    request.fields['caption'] = captiontext.text;
    request.fields['post_id'] = post_id;
    request.fields['post_subject'] = subjectv;
     
    var response = await request.send();

    if (response.statusCode == 200) {
      print('edited');
       Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Socialbasic(0);
                               }));
    }else{
      print('  Not edited');
    }
    
  }
/*Future upload() async {
  if(_file ==null){
    print("null");
    return;
  }
  print(id);
 String base64 = base64Encode(_file.readAsBytesSync());
 String imagename = _file.path.split("/").last;
 final url ="http://192.168.1.8:8081/WallySprouts/post.php";
 var data ={"caption":captiontext.text,"post_user": id, "imagename": imagename,"image64" : base64};
 var response = await http.post(url, body:data);
 //var responsebody = jsonDecode(response.body);
 /*if(responsebody['status'] == "success add")
 {
   print("okkk");
 }
 else
 {
   print("not okkk");
 }*/
  


}*/

  //PickedFile _file;
  //final ImagePicker _picker =ImagePicker();
  @override
String animationType = "roll";
 String subjectv = "Genaric";
  
  Widget build(BuildContext context) 
  {
    
    print(subjectt);
    
    setsubject(value) async
    { 
       setState(() {
         subjectv = value;
          print(subjectv) ;
       });
        
    }
    
    
   /* Widget postimage()
     {
          return Container(
      padding: EdgeInsets.only(
         
        left: 0.0,
        right: 200
      ),
      child: Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                  fit: BoxFit.fill, 
                  image: FileImage(File(_image.path))))),
                  
    );
                     
                       
                       
                         
                      
                       
         
     }*/
   /*  Widget postvedio()
     {
        return Padding(
        padding: const EdgeInsets.all(10.0),
        child: AspectRatioVideo(controller),
      ); /*Container(
    /*  padding: EdgeInsets.only(
         
        left: 0.0,
        right: 200
      ),
      child: Column(
           children: <Widget>[
               
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(

                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
             
          

           ])*/);*/
          
     }*/



     Widget buttonset()
     {
       return  Container(
            
           height:1000,
            
           //Color(0xf00cec9) ,
           width:MediaQuery.of(context).size.width,
            
      child: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               Text(
                 "Add Post Subject",
                 style: TextStyle(
                   fontFamily: 'DancingScript',
                   fontSize: 20
                 ),
                 /*
                  _tagitem("Genaric"),
                 _tagitem("Health"),
                 _tagitem("Medical"),
                 _tagitem("Education"),
                 _tagitem("Play"),
                 _tagitem("Suport"),
                _tagitem("Associations"), */
               ),
               Divider(color: Colors.black,thickness:0.2),
               Row(
                 children:<Widget>[
                   FlatButton(onPressed: (){ setsubject("Genaric");}, child: Text("Genaric" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
               // Divider(color: Colors.black,thickness:0.2),
             
                
               Divider(color: Colors.black,thickness:0.2),
                Row(
                 children:<Widget>[
             FlatButton(onPressed: (){setsubject("Health");
             
            }, child: Text("Health" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
          Divider(color: Colors.black,thickness:0.2),
           Row(
                 children:<Widget>[
             FlatButton(onPressed: (){setsubject("Medical"); }, child: Text("Medical" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
          Divider(color: Colors.black,thickness:0.2),
           Row(
                 children:<Widget>[
             FlatButton(onPressed: (){setsubject("Education"); }, child: Text("Education" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
          Divider(color: Colors.black,thickness:0.2),
            Row(
                 children:<Widget>[
             FlatButton(onPressed: (){ setsubject("Play");}, child: Text("Play" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
          Divider(color: Colors.black,thickness:0.2),
           Row(
                 children:<Widget>[
             FlatButton(onPressed: (){setsubject("Suport"); }, child: Text("Suport" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
          Divider(color: Colors.black,thickness:0.2),
           Row(
                 children:<Widget>[
             FlatButton(onPressed: (){setsubject("Associations"); }, child: Text("Associations" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          )]),
             ],

           ),
           
         ));
       

     }
     return Scaffold(
              appBar: AppBar(
           // elevation: 30,
            centerTitle: true,
            backgroundColor: Color(0xffffffff),
           leading:IconButton(
                icon: Icon(Icons.cancel,color: Colors.black,),
                onPressed: () {
                 Navigator.of(context).pop(MaterialPageRoute(
             builder:(context)=>Socialbasic (0)));
                },), 
                actions: <Widget>[
          
           FlatButton(onPressed: (){update();}, child: Text("Update" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 18.0 ))
        ),
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Text("Update Post",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 25.0))
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20,vertical:20),
                      child:ListView(
                        children:<Widget>[
                       // _image!=null ?postimage():Container(),
                      
                        SizedBox(
                   height: 5.0,
                 ),
                 Container(
                      child: TextFormField(
               controller:captiontext ,
                // autovalidate: true,
                // validator:validkey ,
                decoration: InputDecoration(
                  
                //  labelText: "Email",
                  hintText: "Write Caption...", 
                  // helperText: caption,
                  // suffixIcon: IconButton(icon:Icon(Icons.lock), onPressed: null,color:Colors.blue) ,
                  contentPadding: EdgeInsets.all(10)
                  ),
                  maxLines: 3,
                   
              ),
                 ),
                       SizedBox(
                   height: 5.0,
                 ),
                 
       
                 Divider(color: Colors.black,thickness:0.2),
                  SizedBox(
                   height: 0.0,
                 ),
                         //name(),
                         Container(
                           
                       padding: EdgeInsets.only(
                    top: 10 ,right: 0),
         // resizeToAvoidBottomInset:true,
          height: 40,
          width: 500,
          /* child:FlatButton(onPressed: (){
             showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset()));
           }, child: Text("Post Subject" ,style:TextStyle(color:Colors.grey,fontSize: 15.0, )),
        )*/
        
               // Divider(color: Colors.black,thickness:0.2),
             
                
             child:  Row(
               children: <Widget>[
                 
             FlatButton(onPressed: (){
             showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset()));
           }, child: Text("Post Subject" ,style:TextStyle(color:Colors.grey,fontSize: 15.0, )),
        ),
         SizedBox(
                   height: 20.0,
                   width: 90,
                 ),
         Text( subjectv ,style:TextStyle(color:Colors.grey,fontSize: 15.0, )),
        
        
        
        ]
             

           ),
        
        ),
        SizedBox(
                   height: 15.0,
                 ), 
         Divider(color: Colors.black,thickness:0.2),
                  SizedBox(
                   height: 5.0,
                 ),       
                   
                  Container(
                       padding: EdgeInsets.only(
                    top: 15),
         // resizeToAvoidBottomInset:true,
          height: 250,
          width: 350,
           
       
             child: Center(
              child: Container(
                height: 400,
                width: 250,
                child: new FlareActor(
                  "assets/WorldSpin(1).flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
              // backgroundColor: Colors.white,
            ),
            // key: formState,
          
        ),
        
                   SizedBox(
                   height: 20,
                 ), 



                        ]
                      )
                    
                    
                    
                    
                    ),
     );
     

     
  }
  void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }
}
class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}
