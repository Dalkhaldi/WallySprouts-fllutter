 

import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/social/newPost.dart';
import 'package:wallysprouts/pages/social/photo.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:photofilters/photofilters.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';
 


class Coper extends StatefulWidget {
  final _file;

  Coper(this._file);
   @override
  _CoperState createState() => _CoperState(_file);
}

class _CoperState extends State<Coper> with TickerProviderStateMixin {
   File _file;
   imageLib.Image _im;
   String filename;
   List<Filter> filters = presetFiltersList;
   Future getImages(BuildContext context) async 
   {
    filename= basename(_file.path);
    var image = imageLib.decodeImage(_file.readAsBytesSync());
   image = imageLib.copyResize(image, width: 600);
   Map imagefile =await Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>PhotoFilterSelector(
              title: Text("  Filter  "),
              image: image,
              filters: presetFiltersList,
              filename: filename,
              loader: Center(child: CircularProgressIndicator()),
              fit: BoxFit.contain,
              appBarColor: Color(0xff01a3a4),
            ),)); 
             setState(() {
      //_im =image;
     // _file = image;
      _file = imagefile['image_filtered'];
    });
  } 
   _CoperState(this._file);
   bool isopened =false;
  AnimationController _animationController;
  Animation<Color>_butooncolor;
  Animation<double>_animationicon;
  Animation<double>_translateButton;
  Curve _curve =Curves.easeOut;
  double _height =56.0;
  void initState() 
  {
    _animationController=AnimationController(vsync: this ,duration:Duration(milliseconds: 500))
    ..addListener(() {
      setState((){});
    });
 
   _animationicon=Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
   _butooncolor = ColorTween(begin:Color(0xff01a3a4),
   end: Colors.black).animate(CurvedAnimation(parent:_animationController,
   curve: Interval(0.00, 1.00,curve: Curves.linear) ));
   _translateButton =Tween<double>(begin: _height,end: -14.0,)
   .animate(CurvedAnimation(parent:_animationController,curve: Interval(0.0, 0.75,curve: _curve)));
   super.initState();

  }
  @override
  void dispose() {
    _animationController.dispose();
    
    super.dispose();
  }
  Widget  buttonc()
{
 return Container(child:FloatingActionButton(
   onPressed: (){ 
     getImage() ;
              },
 tooltip: 'crop',
 heroTag: 'c',
child: Icon(Icons.crop),
backgroundColor:Color(0xff01a3a4) ,
 ));
}
Widget  buttonf(BuildContext context)
{
 return Container(child:FloatingActionButton(
   onPressed: ()
   {
        getImages(context);
         
   },
 tooltip: 'filter',
 heroTag: 'f',
child: Icon(Icons.filter),
backgroundColor:Color(0xff01a3a4) ,
 ));
}
Widget  buttontoggle()
{
 return Container(
   child:FloatingActionButton(
     backgroundColor: _butooncolor.value,
   onPressed: animate,
 tooltip: 'toggle',
child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationicon),
 ));
}
animate(){
  if(!isopened)
  {
    _animationController.forward();

  }
  else 
  _animationController.reverse();
  isopened=!isopened;
}
  
   
   getImage() async
   {
     File c_image = await ImageCropper.cropImage(
       sourcePath:_file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor:Color(0xff01a3a4),
          toolbarTitle: "Cropper",
          statusBarColor: Color(0xff01a3a4),
          backgroundColor: Colors.white,
          
        )
    
     );
     this.setState(() {
       _file= c_image;
     });
    
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
              centerTitle: true,
              title:  Text("Edit",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DancingScript',
                    fontSize: 30.0)),
              backgroundColor: Color(0xffffffff),
             leading:IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  onPressed: () {
                   Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>PhotoScreen ()));
                  },),  
                  actions: <Widget>[
             FlatButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Newpost(_file,_file)));
             }, child: Text("Next" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 15.0 ))
          ),
          ],
               
              // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
              //title: Text("Add Post",
      ),
      body: Center(

        child: _file == null? Text("Image is not loaded"): Image.file(_file)
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){getImage() ; },
        tooltip: 'Increment',
        child: Icon(Icons.crop),
        backgroundColor:Color(0xff01a3a4) ,
      ),*/
      floatingActionButton:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget> [
           /* Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value*3.0, 0.0),
            child:buttonAdd(),),*/
             Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value*2.0, 0.0),
            child:buttonc(),),
             Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value , 0.0),
            child:buttonf(context),),
            buttontoggle()
             

          ],
        ),

    );
  }
}