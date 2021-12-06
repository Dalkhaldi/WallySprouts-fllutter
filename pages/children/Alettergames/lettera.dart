import 'dart:ffi';

 
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wallysprouts/pages/children/Alettergames/data.dart';
import 'package:wallysprouts/pages/children/Alettergames/wordsA.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';
 

class Dragabc extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DragPicture(),
    );
  }
}


class DragPicture extends StatefulWidget {
  @override
  _DragPictureState createState() => _DragPictureState();
}

class _DragPictureState extends State<DragPicture> {
   static AudioCache _player = AudioCache();
  var _audioPath = "dukback.mp3";
 
  AudioPlayer _audioPlayer = AudioPlayer();

   Future<AudioPlayer> playAudio() async {
    return _player.play(_audioPath);
  }

  void _stop(){
    if (_audioPlayer != null) {
      _audioPlayer.stop();
  }}
  /* @override
  void initState() {

    playAudio().then((player) {
      _audioPlayer = player;
    });

    super.initState();
  }*/
   
   //var _audioPath2="dukback.mp3";
    @override
  void initState() {
    super.initState();
    initTts();
    
     
    
    // _speak2("Trace the words that begin with the letter a");

  }
  FlutterTts flutterTts;
  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setVolume(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
  }
   Future _speak(String t) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
     
  }
  String animationType = "idle";
  List<bool> _isDone = [false, false, false];
  List<bool> elementState = [false, false, false];
  double itemsize = 80;
  double newsize = 85;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage("assets/back2.png"),
             fit:BoxFit.cover
          ),
        ),
        child: SafeArea(
          
            child: Column(
              children: [
                 Container(
            padding: EdgeInsets.only(right:350,top: 0),
          child: IconButton(
                icon: Icon(Icons.close,
                color:Colors.cyan,
                size: 30,
                ),
                onPressed: () {
                  // _timer.cancel();
                 // Navigator.of(context).pushNamed('users');
 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => abcdsectionchildren(flage: false,),
                  ),
                );
                }
                   
             )),
                Container(
                  width: 500,
                  height: 180,
                 /* decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/board3.png"))),*/
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: itemlist
                            .map((item) => Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: DragTarget<Itemdata>(
                                    onWillAccept: (data) =>
                                        data.name == item.name,
                                    onAccept: (e) {
                                      setState(() {
                                        _isDone[itemlist.indexOf(e)] = true;
                                        elementState[itemlist.indexOf(e)] = true;
                                         if (e.name == "1") {

                                           _stop();
                                           _audioPath="alert.mp3";
                                         //  playAudio();
                                            _speak("ae capital");
                                            animationType="success";
                                            
                                           

                                        }
                                        
                                        
                                         else if (e.name == "2") {
                                          // 
                                           _audioPath="alert.mp3";
                                          // playAudio();
                                           _speak("ae small");
                                            animationType="success";
                                            animationType="idle"; 
                                           
                                           
                                        } 
                                        /* if (e.name != "1") {

                                           _stop();
                                           _audioPath="alert.mp3";
                                         //  playAudio();
                                           // _speak("a capital");
                                            animationType="fail";
                                            
                                           

                                        } */
                                      });
                                    },
                                    builder: (BuildContext context, List incoming,
                                        List rejected) {
                                      return _isDone[itemlist.indexOf(item)]
                                          ? Container(
                                              height: newsize,
                                              width: newsize,
                                              child:
                                                  SvgPicture.asset(item.address),
                                            )
                                          : Container(
                                              height: itemsize,
                                              width: itemsize,
                                              child: SvgPicture.asset(
                                                item.address,
                                                color: Colors.black45,
                                              ),
                                            );
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.black87.withOpacity(0.7),
                        border: Border.all(
                            color: Colors.black54.withOpacity(0.8), width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Wrap(
                          children: itemlist
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Draggable<Itemdata>(
                                      data: e,
                                      onDragStarted: () {
                                        setState(() {
                                          newsize = 85;
                                        });
                                      },
                                      childWhenDragging: Container(
                                        height: itemsize,
                                        width: itemsize,
                                      ),
                                      feedback: Container(
                                        height: itemsize,
                                        width: itemsize,
                                        child: SvgPicture.asset(e.address),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: elementState[itemlist.indexOf(e)]
                                            ? Container(
                                                width: itemsize,
                                                height: itemsize,
                                              )
                                            : Container(
                                                height: itemsize,
                                                width: itemsize,
                                                child:
                                                    SvgPicture.asset(e.address),
                                              ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(
                  height: 36.0,
                     ),
                 Row(
            children:<Widget> [
              Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Container(
                height: 291,
                width: 300,

                 
                    child: new FlareActor(
                      "assets/teddy_test.flr",
                     alignment: Alignment.center, 
                     fit: BoxFit.contain,
                      animation: animationType, 
                      ),
                  ),
                            
                        ),
            ],
          ),
              ],
              
            ),

            
        
          
         
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Dragwords();
                               }));
            
            setState(() {
               
            });
          },
          backgroundColor:Color(0xff01a3a4),  
          child: Icon(
            
             Icons.navigate_next,
          ),
        ),
    );
  }
}
