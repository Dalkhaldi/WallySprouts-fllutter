 
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/social/coper.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';


class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  File _file;
  final ImagePicker _picker =ImagePicker();

  @override
  Widget build(BuildContext context) {
    
    void photo( ) async{
      final image = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
        _file= image;
        });
        }
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
              backgroundColor: Color(0xffffffff),
             leading:IconButton(
                  icon: Icon(Icons.cancel,color: Colors.black,),
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Socialbasic (0)));
                  },),  
         title: Text("Photo",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0)),
        actions: <Widget>[
            
              
             FlatButton(
               onPressed:()
               {       if(_file != null)
                 { 
                Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Coper(_file)));
                 }
               }, 
               child: Text("Next" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 15.0 ))
          ),
          ],
             

      ),
      body: Center(

        child: _file == null? Text("Image is not loaded"): Image.file(_file)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){photo();},
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
        backgroundColor:Color(0xff01a3a4) ,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }}
  ////////////////////////////////////////////////////////////
  /// 