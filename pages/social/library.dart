import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:wallysprouts/pages/social/coper.dart';
import 'package:wallysprouts/pages/social/newPost.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:wallysprouts/pages/social/vedioplay.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

 

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>with TickerProviderStateMixin {
  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  String _retrieveDataError;
  bool isopened =false;
  AnimationController _animationController;
  Animation<Color>_butooncolor;
  Animation<double>_animationicon;
  Animation<double>_translateButton;
  Curve _curve =Curves.easeOut;
  double _height =56.0;
  @override
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
  File _video;
  File _file;
  final filepicker = FilePicker;
  Future choiceFile() async {
     await FilePicker.getFile() .then((File file) {
        if (file != null && mounted) {
          setState(() {
            _video=file;
            _controller = VideoPlayerController.file(file)
              ..addListener(_onVideoControllerUpdate)
              ..setVolume(1.0)
              ..initialize()
              //..setLooping(true)
              ..play();
          });
        }
      });
  }

  void _onImageButtonPressed(ImageSource source) async {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    if (isVideo) {
      choiceFile();
      
    } else {
      try {
        _imageFile = await ImagePicker.pickImage(source: source);
      } catch (e) {
        _pickImageError = e;
      }
      setState(() {});
    }
  }

  void _onVideoControllerUpdate() {
    setState(() {});
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Widget _previewVideo(VideoPlayerController controller) {
    final Text retrieveError = _getRetrieveErrorWidget();
    print(controller.dataSource);
    print("kkkkkkkkkkkkkkkk");
    if (retrieveError != null) {
      return retrieveError;
    }
   /* if (controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    } */ /*if (controller.value.initialized) {
      return Padding(
      
        padding: const EdgeInsets.all(10.0),
        child: AspectRatioVideo(controller),
      );*/
    else{ return MaterialApp(
       
      home: Scaffold(
        body: Center(
          child: controller.value.initialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : Container(),
    )));
        }
    /* else {
      return const Text(
        'Error Loading Video',
        textAlign: TextAlign.center,
      );
    }*/
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.type == RetrieveType.video) {
          isVideo = true;
          _controller = VideoPlayerController.file(response.file)
            ..addListener(_onVideoControllerUpdate)
            ..setVolume(1.0)
            ..initialize()
            ..setLooping(true)
            ..play();
        } else {
          isVideo = false;
          _imageFile = response.file;
        }
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }
 /* Widget buttonAdd()
{
 return Container(child:FloatingActionButton(onPressed: (){},
 tooltip: 'Add',
 heroTag: 'add',
child: Icon(Icons.add),
backgroundColor:Color(0xff01a3a4) ,
 ));
}*/

Widget  buttonc()
{
 return Container(child:FloatingActionButton(
   onPressed: (){isVideo = false;
              _onImageButtonPressed(ImageSource.gallery);
              },
 tooltip: 'camera',
 heroTag: 'cam',
child: Icon(Icons.photo_library),
backgroundColor:Color(0xff01a3a4) ,
 ));
}
Widget  buttonv()
{
 return Container(child:FloatingActionButton(
   onPressed: ()
   {
        isVideo = true;
         _onImageButtonPressed(ImageSource.gallery);
   },
 tooltip: 'video',
 heroTag: 'vid',
child: Icon(Icons.video_library),
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
  

  @override
  Widget build(BuildContext context) {
    final List<String>alb=["Recent","ScreanShots","Videos","Camera","facebook","whatsupimages"];
    String selectedalb ="Recent";
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
                  actions: <Widget>[
            DropdownButton<String>(
              value: selectedalb,
               onChanged: (value){
                  setState(() {
                    selectedalb = value;
                    print(selectedalb);
                  });
              },
              items: alb.map<DropdownMenuItem<String>>((value){
                return DropdownMenuItem(
                  child:Text(value),
                  
                  value: value,
                  
                  );
                  
              }).toList(),
             
              ),
              
             FlatButton(onPressed: (){
               if(!isVideo &&_imageFile!=null){
               Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Coper(_imageFile)));}
               else if(isVideo && _controller!=null){
                  _controller.pause();
                 Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Newpost(_imageFile, _video)));
              /* Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=> VideoApp()));*/
              
               }
             }, child: Text("Next" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 15.0 ))
          ),
          ],
               
              // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
              //title: Text("Add Post",
      ),
      body: Center(
        child: Platform.isAndroid
            ? FutureBuilder<void>(
          future: retrieveLostData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
             /* case ConnectionState.waiting:
                return const Text(
                  'You have not yet picked an image.',
                  textAlign: TextAlign.center,
                );*/
              case ConnectionState.done:
                return isVideo
                    ? _previewVideo(_controller)
                    : _previewImage();
              default:
                if (snapshot.hasError) {
                  return Text(
                    'Pick image/video error: ${snapshot.error}}',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Text(
                    'You have not yet picked an image.',
                    textAlign: TextAlign.center,
                  );
                }
            }
          },
        )
            : (isVideo ? _previewVideo(_controller) : _previewImage()),
      ),
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
            child:buttonv(),),
            buttontoggle()
             

          ],
        ),
     /* floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              isVideo = false;
              _onImageButtonPressed(ImageSource.gallery);
            },
            heroTag: 'image0',
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
              heroTag: 'video0',
              tooltip: 'Pick Video from gallery',
              child: const Icon(Icons.video_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'video1',
              tooltip: 'Take a Video',
              child: const Icon(Icons.videocam),
            ),
          ),
        ],
      ),*/
    );
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
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
        child: AspectRatioVideo(
          //aspectRatio: controller.value?.aspectRatio,
         // child: VideoPlayer(controller),
         controller
        ),
      );
    } else {
      return Container();
    }
  }
}





/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';

import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:video_player/video_player.dart';
 
 
class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>with TickerProviderStateMixin {
  PickedFile _file;
  File _imagefile;
  final ImagePicker _picker =ImagePicker();
  dynamic _pickimageerror;
  bool isvideo=false;
  VideoPlayerController _controller;
  String _retrivedataerror;

  bool isopened =false;
  AnimationController _animationController;
  Animation<Color>_butooncolor;
  Animation<double>_animationicon;
  Animation<double>_translateButton;
  Curve _curve =Curves.easeOut;
  double _height =56.0;
  @override
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
  //////////////////////////////////////////////////////////////////
  photo(ImageSource source) async{
      final pickedFile= await _picker.getImage(
        source: source);
        setState(() {
        _file= pickedFile;
        });
    }
    void _onImageButtonPressed(ImageSource source) async {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    if (isvideo) {
      ImagePicker.pickVideo(source: source).then((File file) {
        if (file != null && mounted) {
          setState(() {
            _controller = VideoPlayerController.file(file)
              ..addListener(_onVideoControllerUpdate)
              ..setVolume(1.0)
              ..initialize()
              ..setLooping(true)
              ..play();
          });
        }
      });
    } else {
      try {
       _imagefile = await ImagePicker.pickImage(source: source);
      } catch (e) {
         _pickimageerror = e;
      }
      setState(() {});
    }
  }
  void _onVideoControllerUpdate() {
    setState(() {});
  }
   @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(_onVideoControllerUpdate);
    }
    super.deactivate();
  }
  Widget _previewVideo(VideoPlayerController controller) {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    } else if (controller.value.initialized) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: AspectRatioVideo(controller),
      );
    } else {
      return const Text(
        'Error Loading Video',
        textAlign: TextAlign.center,
      );
    }
  }
  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imagefile != null) {
      return Image.file(_imagefile);
    } else if (_pickimageerror != null) {
      return Text(
        'Pick image error: $_pickimageerror',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }
  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.type == RetrieveType.video) {
          isvideo = true;
          _controller = VideoPlayerController.file(response.file)
            ..addListener(_onVideoControllerUpdate)
            ..setVolume(1.0)
            ..initialize()
            ..setLooping(true)
            ..play();
        } else {
          isvideo = false;
          _imagefile = response.file;
        }
      });
    } else {
     _retrivedataerror = response.exception.code;
    }
  }


    /////////////////////////////////////////////////////////////////
  void dispose()
{
  _animationController.dispose();
  if (_controller != null) {
      _controller.dispose();
    }
  super.dispose();
}
Widget buttonAdd()
{
 return Container(child:FloatingActionButton(onPressed: (){},
 tooltip: 'Add',
 heroTag: 'add',
child: Icon(Icons.add),
backgroundColor:Color(0xff01a3a4) ,
 ));
}

Widget  buttonc()
{
 return Container(child:FloatingActionButton(onPressed: (){photo(ImageSource.gallery);},
 tooltip: 'camera',
 heroTag: 'cam',
child: Icon(Icons.camera_alt),
backgroundColor:Color(0xff01a3a4) ,
 ));
}
Widget  buttonv()
{
 return Container(child:FloatingActionButton(onPressed: (){},
 tooltip: 'video',
 heroTag: 'vid',
child: Icon(Icons.videocam),
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
  @override
  Widget build(BuildContext context) {
  
    
    final List<String>alb=["Recent","ScreanShots","Videos","Camera","facebook","whatsupimages"];
    String selectedalb ="Recent";
     
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
                  actions: <Widget>[
            DropdownButton<String>(
              value: selectedalb,
               onChanged: (value){
                  setState(() {
                    selectedalb = value;
                    print(selectedalb);
                  });
              },
              items: alb.map<DropdownMenuItem<String>>((value){
                return DropdownMenuItem(
                  child:Text(value),
                  
                  value: value,
                  
                  );
                  
              }).toList(),
             
              ),
              
             FlatButton(onPressed: null, child: Text("Next" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 15.0 ))
          ),
          ],
               
              // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
              //title: Text("Add Post",
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed:(){ photo(ImageSource.gallery);},
        tooltip: 'add',
        child: Icon(Icons.add),
        backgroundColor:Color(0xff01a3a4) ,
        highlightElevation: 50,
        ),*/
        floatingActionButton:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget> [
            Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value*3.0, 0.0),
            child:buttonAdd(),),
             Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value*2.0, 0.0),
            child:buttonc(),),
             Transform(
              transform: Matrix4.translationValues(
                0.0, _translateButton.value , 0.0),
            child:buttonv(),),
            buttontoggle()
             

          ],
        ),
     body: MediaGrid(),
    );
  }}
  class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}class _MediaGridState extends State<MediaGrid> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int lastPage;
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }
  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }
  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
          await PhotoManager.getAssetPathList(hasAll: true);//new
          await PhotoManager.getAssetPathList(hasAll: true);//screen
          await PhotoManager.getAssetPathList(hasAll: true);//vedios
          await PhotoManager.getAssetPathList(hasAll: true);//camera
          await PhotoManager.getAssetPathList(hasAll: true);//screan record
          await PhotoManager.getAssetPathList(hasAll: true);//no need
          await PhotoManager.getAssetPathList(hasAll: true);//feacbook
          await PhotoManager.getAssetPathList(hasAll: true);//whatsabgift
          await PhotoManager.getAssetPathList(hasAll: true);//whatsabimages
          
      print(albums);
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(currentPage, 60);
      print(media);
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return GestureDetector(
                  onTap: () async {
                    File file = await asset.file;
                    //upload file to firebase
                  },
                  child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (asset.type == AssetType.video)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 5),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                );
              return Container();
            },
          ),
        );
      }setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }@override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
          }),
    );
  }
}
 Text _getRetrieveErrorWidget() {
    if (_retrivedataerror != null) {
      final Text result = Text(_retrivedataerror);
      _retrivedataerror = null;
      return result;
    }
    return null;
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
}*/
