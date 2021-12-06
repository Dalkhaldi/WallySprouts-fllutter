import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/childfirstpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
 

class VideoApp extends StatefulWidget {
  final String videio_id;
  VideoApp(this.videio_id);
  @override
  _VideoAppState createState() => _VideoAppState(videio_id);
}

class _VideoAppState extends State<VideoApp> {
  String videio_id;
  _VideoAppState(this.videio_id);
  VideoPlayerController _controller;

 /* @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }*/

  String videopath;
  showvideo()
  {
    _controller = VideoPlayerController.network(
        'http://192.168.1.8:8081/WallySprouts/childvideo/$videopath')
      ..initialize().then((_) {
         
                                       DecorationImage(
                                      image: NetworkImage(
                                        " http://192.168.1.8:8081/WallySprouts/childvideo/giphy.gif",
                                      ),
                                      fit: BoxFit.fill,
                                    );
         
        setState(() {});
      });
  }
Future getvideos( ) async {
    print("hhhhhhhhhhhhhhhhhhhhhh");
     
    var data = {"video_id": videio_id};
    
    var url;
    url = "http://192.168.1.8:8081/WallySprouts/showvideochild.php";
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody.toString() + "kkkkk");
    videopath=responsebody[0]['video_path'];
    print(videopath);
    showvideo();
    return responsebody;
  }
  

  @override
  void initState() {
    getvideos();
    //print('http://192.168.1.8:8081/WallySprouts/childvideo/$videopath');
    super.initState();
     _controller = VideoPlayerController.network(
        'http://192.168.1.8:8081/WallySprouts/childvideo/$videopath')
        
      ..initialize().then((_) {
        DecorationImage(
                                      image: NetworkImage(
                                        " http://192.168.1.8:8081/WallySprouts/childvideo/giphy.gif",
                                      ),
                                      fit: BoxFit.fill,
                                    );
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      color: Color(0xff17a589),
      home: Scaffold(
        
        body: Container(
         // width: 100,
         // height: ,
          
          child: Stack(
        children: <Widget>[
           
          Positioned(
                      child: Center(
            
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
        ),
          ),
           IconButton(
                 onPressed: () {Navigator.of(context).pop(MaterialPageRoute(
               builder:(context)=>Welcomechilde()));},
                 icon: Icon(Icons.arrow_back_ios,size: 30,),
                                ),
          Positioned(
            
              child: Container(
                 margin:EdgeInsets.only( bottom: 620, right:270,top: 10), 
            height: 700 ,
            width: 1200,
            )),])),
        floatingActionButton: FloatingActionButton(
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}