import 'dart:ffi';

 
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wallysprouts/pages/children/Alettergames/dragalpha.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';

 

class Dragwords extends StatelessWidget {
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
      home: DragPicturewords(),
    );
  }
}

class DragPicturewords extends StatefulWidget {
  @override
  _DragPicturewordsState createState() => _DragPicturewordsState();
}

class _DragPicturewordsState extends State<DragPicturewords> {
   static AudioCache _player = AudioCache();
  var _audioPath = "a.mp3";
 
  AudioPlayer _audioPlayer = AudioPlayer();

   Future<AudioPlayer> playAudio(_audioPath) async {
    return _player.play(_audioPath);
  }

  void _stop(){
    if (_audioPlayer != null) {
      _audioPlayer.stop();
  }}
   @override
  void initState() {

    playAudio(_audioPath).then((player) {
      _audioPlayer = player;
    });

    super.initState();
  }
   
   //var _audioPath2="dukback.mp3";
   List<Item> itemlist = [
  Item(name: "1", address: "assets/A.svg",voice:"kid-a.mp3"),
  Item(name: "2", address: "assets/p.svg",voice:"kid-p.mp3"),
  Item(name: "3", address: "assets/p.svg",voice:"kid-p.mp3"),
  Item(name: "4", address: "assets/l.svg",voice:"kid-l.mp3"),
  Item(name: "5", address: "assets/e.svg",voice:"kid-e.mp3"),
 
  

   
];
 
  String animationType = "idle";
  List<bool> _isDone = [false, false, false,false,false];
  List<bool> elementState = [false, false, false,false,false];
  double itemsize =40;
  double newsize = 40;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage("assets/back3.png"),
             fit:BoxFit.cover
          ),
        ),
        child: SafeArea(
          
            child: Column(
              children: [
                
                Container(
                  width: 500,
                  height: 180,
                 /* decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/board3.png"))),*/
                   
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Wrap(
                        children: itemlist
                            .map((item) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: DragTarget<Item>(
                                    onWillAccept: (data) =>
                                        data.name == item.name,
                                    onAccept: (e) {
                                      setState(() {
                                        _isDone[itemlist.indexOf(e)] = true;
                                        elementState[itemlist.indexOf(e)] = true;
                                        _audioPath= e.voice;
                                           playAudio(_audioPath);
                                           animationType="success";
                                         /*if (e.name == "1") {

                                          // _stop();
                                           _audioPath="kid-a.mp3";
                                           playAudio(_audioPath);
                                           

                                        } else if (e.name == "2") {
                                           _audioPath="a.mp3";
                                           playAudio(_audioPath);
                                        } 
                                         if (e.name == "3") {

                                          // _stop();
                                           _audioPath="b.mp3";
                                           playAudio(_audioPath);
                                           

                                        }
                                         if (e.name == "1") {

                                          // _stop();
                                           _audioPath="b.mp3";
                                           playAudio(_audioPath);
                                           

                                        }
                                         if (e.name == "4") {

                                          // _stop();
                                           _audioPath="b.mp3";
                                           playAudio(_audioPath);
                                           

                                        } 
                                         if (e.name == "5") {

                                          // _stop();
                                           _audioPath="b.mp3";
                                           playAudio(_audioPath);
                                           

                                        }*/

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.black87.withOpacity(0.7),
                        border: Border.all(
                            color: Colors.black54.withOpacity(0.8), width: 3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                       
                        child: Wrap(
                          children: itemlist
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Draggable<Item>(
                                      data: e,
                                      onDragStarted: () {
                                        setState(() {
                                          newsize = 50;
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
                
                SizedBox(
                  height: 54.0,
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
                                   return GameDDAnimaleMatching();
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
class Item {
  final String name;
  final String address;
  final String voice;
  Item({this.name, this.address,this.voice});
}
