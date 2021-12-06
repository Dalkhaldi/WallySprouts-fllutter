import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallysprouts/pages/children/Alettergames/drawA1.dart';
import 'package:wallysprouts/pages/children/Blettergames/beginB.dart';
import 'package:wallysprouts/pages/children/Blettergames/testgame2b.dart';
import 'package:wallysprouts/pages/children/Blettergames/drawB1.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';

//Add Arabic
class Dragb extends StatefulWidget {
  @override
  _DragbState createState() => _DragbState();
}

class _DragbState extends State<Dragb> {
  List<ItemAnimal> item1;
  List<ItemAnimal> items2;
  static AudioCache _player = AudioCache();
  static const _audioPath = "success.mp3";
  AudioPlayer _audioPlayer = AudioPlayer();

  Future<AudioPlayer> playAudio() async {
    return _player.play(_audioPath);
  }

  void _stop() {
    if (_audioPlayer != null) {
      _audioPlayer.stop();
    }
  }

  String checkmod(int score, int time_now1) {
    if (score >= 75 && time_now < 30) {
      return "Excellent 👑😁";
    } else if (score >= 65 && time_now1 < 60) {
      return "Very Good 😊";
    } else if (score >= 55 && time_now1 < 90) {
      return "Good 🙂";
    } else if (score >= 40 && time_now1 < 180) {
      return "Acceptable 🙂";
    } else {
      return "You lose, try again🙁";
    }
  }

  int score;
  bool gameOver;
  FlutterTts flutterTts;
  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setVolume(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
  }

  @override
  void initState() {
    super.initState();
    timer_counter();
    initGame();
    initTts();
  }

  Future _speak(String t) async {
    //print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
  }

  Timer _timer;
  timer_counter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        time_now++;
      });
    });
  }

  int time_now = 0;
  initGame() {
    gameOver = false;
    score = 0;
    item1 = [
      ItemAnimal(image: AssetImage("assets/Letter-Z-icon.png"),  name: "Zebra", value: "Zebra"),
      ItemAnimal(image: AssetImage("assets/Letter-B-icon.png"), name: "Bag", value: "Bag"),
      ItemAnimal(image: AssetImage("assets/Letter-C-icon.png"), name: "Cub", value: "Cub"),
      ItemAnimal(image: AssetImage("assets/Letter-G-icon.png"), name: "Grub", value: "Grub"),
      ItemAnimal(image: AssetImage("assets/Letter-J-icon.png"), name: "Job", value: "Job"),
      ItemAnimal(image: AssetImage("assets/Letter-F-icon.png"), name: "Fib", value: "Fib"),
      ItemAnimal(image: AssetImage("assets/Letter-L-icon.png"), name: "Lamb", value: "Lamb"),
      ItemAnimal(image:AssetImage("assets/Letter-T-icon.png"), name: "Tab", value: "Tab"),
    ];
    items2 = List<ItemAnimal>.from(item1);
    item1.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (item1.length == 0) {
      _timer.cancel();
      gameOver = true;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return GamesubMathcingb();//GameDDAnimaleMatching();
                               }));
        },
      ),
      backgroundColor: Colors.black,
       
      body: Container(
         constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage("assets/back4.png"),
             fit:BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              /*Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Score: ",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                TextSpan(
                    text: "$score   Time : $time_now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ))
              ])),*/
               Container(
            padding: EdgeInsets.only(right:350,top: 0),
          child: IconButton(
                icon: Icon(Icons.close,
                color:Colors.cyan,
                size: 30,
                ),
                onPressed: () {
                   _timer.cancel();
                 // Navigator.of(context).pushNamed('users');
 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => abcdsectionchildren(flage: false,),
                  ),
                );})),
              SizedBox(
                height:20,
              ),
              if (!gameOver)
                Row(
                  children: <Widget>[
                    
                    Column(
                        children: item1.map((item) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Draggable<ItemAnimal>(
                          data: item,
                          childWhenDragging: Image(
                           image: item.image,
                            color: Colors.grey,
                           // size: 50.0,
                          ),
                          feedback: Image(
                            image: 
                            item.image,
                            //color: Colors.purpleAccent[100],
                            //size: 50,
                          ),
                          child: Image(
                            image:item.image, 
                           // color: Colors.purpleAccent[100],
                           // size: 50,
                          ),
                        ),
                      );
                    }).toList()),
                    Spacer(),
                    Column(
                        children: items2.map((item) {
                      return DragTarget<ItemAnimal>(
                        onAccept: (receivedItem) {
                          if (item.value == receivedItem.value) {
                            setState(() {
                              item1.remove(receivedItem);
                              items2.remove(item);
                              score += 10;
                              
                              setState(() {
                                if (item.value == "Zebra") {
                                  _speak("Zebra");
                                } else if (item.value == "Cub") {
                                  _speak("Cub");
                                } else if (item.value == "Bag") {
                                  _speak("Bag");
                                } else if (item.value == "Grub") {
                                  _speak("Grub");
                                }   else if (item.value == "Job") {
                                  _speak("Job");
                                } else if (item.value == "Fib") {
                                  _speak("Fib");
                                } else if (item.value == "Lamb") {
                                  _speak("Lamb");
                                } else if (item.value == "Tab") {
                                  _speak("Tab");
                                }
                              });

                              item.accepting = false;
                            });
                          } else {
                            setState(() {
                              score -= 5;
                              item.accepting = false;
                            });
                          }
                        },
                        onLeave: (receivedItem) {
                          setState(() {
                            item.accepting = false;
                          });
                        },
                        onWillAccept: (receivedItem) {
                          setState(() {
                            item.accepting = true;
                          });

                          return true;
                        },
                        builder: (context, acceptedItems, rejectedItem) =>
                            Container(
                          color: item.accepting ? Colors.red : Colors.blueGrey,
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      );
                    }).toList()),
                  ],
                ),
              if (gameOver)
                Column(children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    score == 80 && time_now < 25
                        ? "Special 👑💯/💯👑😁"
                        : checkmod(score, time_now),
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Time you Take $time_now Seconds",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff01a3a0),
                      child: Text("New Game"),
                      onPressed: () {
                        setState(() {
                           Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context){
                                     return Dragb ();
                                 }));
                      },
                    );
                       } )
                )])
            ],
          ),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();

class ItemAnimal {
  final String name;
  final String value;
  final AssetImage image;
  final IconData icon;

  bool accepting;

  ItemAnimal({this.name, this.value,this.image, this.icon, this.accepting = false});
}
