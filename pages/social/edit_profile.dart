import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Editprofile extends StatefulWidget {
  String image;
  String name;
  String bio;
  Editprofile(this.image,this.name,this.bio);
   @override
  _EditprofileState createState() => _EditprofileState(image,name,bio);
}

class _EditprofileState extends State<Editprofile> {
   String image;
   String name;
  String bio;
  _EditprofileState(this.image,this.name,this.bio);
  PickedFile _image;
  final ImagePicker _picker =ImagePicker();
  @override
final bioController = TextEditingController();
final nameController = TextEditingController();
var user = "";
  var email = "";
  var id;
  
Future upload() async {
 
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/editprofile.php");
     var request = http.MultipartRequest('POST',uri);
    request.fields['name'] = nameController.text;
    request.fields['id'] = id;
    bioController.text==null?request.fields['Bio'] = bioController.text:request.fields['Bio'] = bio;
    nameController.text==null? request.fields['username'] = nameController.text:request.fields['username'] = name;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('edited');
    }else{
      print('not edited');
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
    super.initState();
  }





  Widget build(BuildContext context) 
  {
    void photo(ImageSource source) async{
      final pickedFile= await _picker.getImage(
        source: source);
        setState(() {
        _image= pickedFile;
        });
    }
    Widget buttonset()
     {
       return  Container(
            
           height:221,
           //Color(0xf00cec9) ,
           width:MediaQuery.of(context).size.width,
           margin:EdgeInsets.symmetric(
             horizontal:20,
             vertical:20
             
           ),
            
          
           child: Column(
             children: <Widget>[
               Text(
                 "Change Profile Photo",
                 style: TextStyle(
                   fontFamily: 'DancingScript',
                   fontSize: 20
                 ),
                 
               ),
               Divider(color: Colors.black,thickness:0.2),
               
                   FlatButton(onPressed: (){photo(ImageSource.camera);}, child: Text("Remove Curent photo" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
               // Divider(color: Colors.black,thickness:0.2),
              Divider(color: Colors.black,thickness:0.2),
               
                   FlatButton(onPressed: (){photo(ImageSource.camera);}, child: Text("Take Photo" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
                
               Divider(color: Colors.black,thickness:0.2),
             FlatButton(onPressed: (){photo(ImageSource.gallery);}, child: Text("Choose frome Library" ,style:TextStyle(color:Colors.black,fontSize: 18.0 ))
          ),
             ],

           ),
           
         );
       

     }
    Widget profileimage()
     {
          return Center(
            child: Stack(
             // alignment: AlignmentDirectional.center,
                     children:<Widget> [
                      CircleAvatar(
                        radius:70.0,
                        backgroundImage: _image ==null?NetworkImage(
                                              "http://192.168.1.8:8081/WallySprouts/upload/$image",
                                            ):FileImage(File(_image.path)),
                         
                      ),
                       /*Positioned(
                         bottom: 20,
                         right: 20,
                         child: InkWell(
                           onTap:(){
                               showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset()));
                              
                              
                              },
                           
                         )
                       
                       
                       
                       )*/





                     ],
            ),
          );
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
             builder:(context)=>Socialbasic (3)));
                },),  
                actions: <Widget>[
          
           FlatButton(onPressed: (){upload();}, child: Text("Done" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 18.0 ))
        ),
        ],
             
            // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
            title: Text("Edit Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0))
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20,vertical:20),
                      child:ListView(
                        children:<Widget>[
                       profileimage(),
                       SizedBox(
                   height: 5.0,
                 ),
                 FlatButton(onPressed: (){
                   showModalBottomSheet(context: context, 
                               builder:((builder) =>buttonset()));
                 }, child: Text("Change Profile Photo" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 12.0 ))
        ),
       
                 Divider(color: Colors.black,thickness:0.2),
                  SizedBox(
                   height: 10.0,
                 ),
                         //name(),
                         Container(
                       padding: EdgeInsets.only(
                    top: 10),
         // resizeToAvoidBottomInset:true,
          height: 95,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xff01a3a4),width: 1),
              color: Colors.white
          ),
        child:Center(
           child:Form(
            // key: formState,
          child: Column(
            children: <Widget>[

              TextFormField(
                controller:nameController ,
                // autovalidate: true,
                // validator:validkey ,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                //  labelText: "Email",
                 // hintText: "what is the key?", 
                  labelText: "Name",
                  // suffixIcon: IconButton(icon:Icon(Icons.lock), onPressed: null,color:Colors.blue) ,
                  contentPadding: EdgeInsets.all(20)),
              ),
                
             // Divider(color: Colors.lightBlue,thickness:1.0),

               
                 //Divider(color:Colors.lightBlue,thickness:1.0),
            ],
          ),
           ),
        ),
        ),
                         SizedBox(
                   height: 20,
                 ), 
                  // Bio(),
                  Container(
                       padding: EdgeInsets.only(
                    top: 10),
         // resizeToAvoidBottomInset:true,
          height: 150,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: Colors.white,
              border: Border.all(color: Color(0xff01a3a4),width: 1),
          ),
        child:Center(
           child:Form(
            // key: formState,
          child: Column(
            children: <Widget>[

              TextFormField(
                controller:bioController ,
                // autovalidate: true,
               //  validator:validkey ,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                //  labelText: "Email",
                 // hintText: "what is the key?", 
                  labelText: "Bio",
                   //suffixIcon: IconButton(icon:Icon(Icons.lock), onPressed: null,color:Colors.blue) ,
                  contentPadding: EdgeInsets.all(20)),
                  
              ),
                
             // Divider(color: Colors.lightBlue,thickness:1.0),

               
                 //Divider(color:Colors.lightBlue,thickness:1.0),
            ],
          ),
           ),
        ),
        ),
                   SizedBox(
                   height: 20,
                 ), 



                        ]
                      )
                    
                    
                    
                    
                    ),
     );
     

     
  }
}
