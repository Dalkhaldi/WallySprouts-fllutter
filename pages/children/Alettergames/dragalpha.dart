import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'dart:convert';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallysprouts/pages/children/Alettergames/drawA1.dart';
import 'package:wallysprouts/pages/children/Alettergames/testgame2.dart';
import 'dart:math';
import 'package:wallysprouts/pages/children/pagechoice2.dart';

//Add Arabic
class GameDDAnimaleMatching extends StatefulWidget {
  @override
  _GameDDAnimaleMatchingState createState() => _GameDDAnimaleMatchingState();
}

class _GameDDAnimaleMatchingState extends State<GameDDAnimaleMatching> {
  List<ItemAnimal> item1;
  List<ItemAnimal> item3;
  List<ItemAnimal> item4;
  List<ItemAnimal> items2;
    List<ItemAnimal> items33;
      List<ItemAnimal> items44;
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
  int keysend;
Random key =new Random();

  int scoreDB = 0;
bool language = false;

  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      language = preferences.getBool("language");
      if (language == null) {
        language = false;
      }
    });
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  String childID = " ";
  getpref1() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      childID = preferences.getString("childID");
      print(childID);
    });
  }
  String checkmod(int score, int time_now1) {
    if (score == 60 && time_now1 < 60) {
      scoreDB = 10;
      initGame();
      time_now = 0;
      return language ? "👑💯/💯👑😁 متميز " : "Special 👑💯/💯👑😁";
    } else if (score >= 50 && time_now1 < 300) {
      scoreDB = 9;
      initGame();
      time_now = 0;
      return language ? "👑😁 ممتاز " : "Excellent 👑😁";
    } else if (score >= 40 && time_now1 < 500) {
      scoreDB = 8;
      initGame();
      time_now = 0;
      return language ? "😊جيد جدا " : "Very Good 😊";
    } else if (score >= 30 && time_now1 < 1000) {
      scoreDB = 7;
      initGame();
      time_now = 0;
      return language ? "🙂جيد  " : "Good 🙂";
    } else if (score >= 25 && time_now1 < 2000) {
      scoreDB = 5;
      initGame();
      time_now = 0;
      return language ? "🙂مقبول " : "Acceptable 🙂";
    } else {
      scoreDB = 0;
      initGame();
      time_now = 0;
      return language ? "🙁لقد خسرت حاول مره اخرى  " : "You lose, try again🙁";
    }
  }

Future saveScore(int score, int time_now1) async {
    if (score == 80 && time_now1 < 25) {
      scoreDB = 10;
    } else if (score >= 75 && time_now1 < 30) {
      scoreDB = 9;
    } else if (score >= 65 && time_now1 < 60) {
      scoreDB = 8;
    } else if (score >= 55 && time_now1 < 90) {
      scoreDB = 7;
    } else if (score >= 40 && time_now1 < 180) {
      scoreDB = 5;
    } else {
      scoreDB = 0;
    }
    var data = {
      "score": "$scoreDB",
      "score_in": "letter",
      "id_for_child": childID,
    };
    var url = "http://192.168.1.11:8081/WallySprouts/childrenScores.php";
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == "success") {
      showToast('Score  Saved', gravity: Toast.BOTTOM, duration: 3);
      print(" ok ");
    } else {
      showToast('Score doesnt Save', gravity: Toast.BOTTOM, duration: 3);
      print("not ok");
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
    keysend=key.nextInt(20);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(keysend);
    if(keysend<15)
    it=false;
    else it=true;
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
  bool it =false;
  int time_now = 0;
  initGame() {
    gameOver = false;
    score = 0;
    item1 = [
      ItemAnimal(image: AssetImage("assets/Letter-A-icon.png"),  name: "Apple", value: "Apple"),
      ItemAnimal(image: AssetImage("assets/Letter-B-icon.png"), name: "Banana", value: "Banana"),
      ItemAnimal(image: AssetImage("assets/Letter-C-icon.png"), name: "Cat", value: "Cat"),
      ItemAnimal(image: AssetImage("assets/Letter-D-icon.png"), name: "Dark", value: "Dark"),
      ItemAnimal(image: AssetImage("assets/Letter-E-icon.png"), name: "Ear", value: "Ear"),
      ItemAnimal(image: AssetImage("assets/Letter-P-icon.png"), name: "Paint", value: "Paint"),
      ItemAnimal(image: AssetImage("assets/Letter-F-icon.png"), name: "Face", value: "Face"),
      ItemAnimal(image:AssetImage("assets/Letter-T-icon.png"), name: "Tail", value: "Tail"),
    ];
     item3 = [
      ItemAnimal(image: AssetImage("assets/Letter-O-icon.png"),  name: "Apple", value: "Apple"),
      ItemAnimal(image: AssetImage("assets/Letter-L-icon.png"), name: "Banana", value: "Banana"),
      ItemAnimal(image: AssetImage("assets/Letter-M-icon.png"), name: "Cat", value: "Cat"),
      ItemAnimal(image: AssetImage("assets/Letter-N-icon.png"), name: "Dark", value: "Dark"),
      ItemAnimal(image: AssetImage("assets/Letter-K-icon.png"), name: "Ear", value: "Ear"),
      ItemAnimal(image: AssetImage("assets/Letter-Z-icon.png"), name: "Paint", value: "Paint"),
      ItemAnimal(image: AssetImage("assets/Letter-G-icon.png"), name: "Face", value: "Face"),
      ItemAnimal(image:AssetImage("assets/Letter-U-icon.png"), name: "Tail", value: "Tail"),
    ];
     item4 = [
      ItemAnimal(image: AssetImage("assets/Letter-A-icon.png"),  name: "Apple", value: "Apple"),
      ItemAnimal(image: AssetImage("assets/Letter-B-icon.png"), name: "Banana", value: "Banana"),
      ItemAnimal(image: AssetImage("assets/Letter-C-icon.png"), name: "Cat", value: "Cat"),
      ItemAnimal(image: AssetImage("assets/Letter-D-icon.png"), name: "Dark", value: "Dark"),
      ItemAnimal(image: AssetImage("assets/Letter-E-icon.png"), name: "Ear", value: "Ear"),
      ItemAnimal(image: AssetImage("assets/Letter-P-icon.png"), name: "Paint", value: "Paint"),
      ItemAnimal(image: AssetImage("assets/Letter-F-icon.png"), name: "Face", value: "Face"),
      ItemAnimal(image:AssetImage("assets/Letter-T-icon.png"), name: "Tail", value: "Tail"),
    ];
    items2 = List<ItemAnimal>.from(item1);
    item1.shuffle();
    items2.shuffle();
     items33 = List<ItemAnimal>.from(item3);
    item3.shuffle();
    items33.shuffle();
     items44 = List<ItemAnimal>.from(item4);
    item4.shuffle();
    items44.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (item1.length == 0) {
      _timer.cancel();
      gameOver = true;
    }
    if(!gameOver)
    {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next,),
        backgroundColor: Colors.cyan,
        onPressed: () {
           _timer.cancel();
           keysend=key.nextInt(20);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(keysend);
   setState(() {
     if(keysend<15)
    it=false;
    else it=true;
   }); 
          Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return GamesubMathcing();//GamesubMathcing();//CanvasPainting();//GameDDAnimaleMatching();
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
                );
                }
                   
             )),
              SizedBox(
                height:20,
              ),
              if (!gameOver&&!it)
              
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
                                if (item.value == "Apple") {
                                  _speak("Apple");
                                } else if (item.value == "Cat") {
                                  _speak("Cat");
                                } else if (item.value == "Banana") {
                                  _speak("Banana");
                                } else if (item.value == "Dark") {
                                  _speak("Dark");
                                }   else if (item.value == "Paint") {
                                  _speak("Paint");
                                } else if (item.value == "Face") {
                                  _speak("Face");
                                } else if (item.value == "Ear") {
                                  _speak("Ear");
                                } else if (item.value == "Tail") {
                                  _speak("Tail");
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
               /* if(!gameOver&&it)
                Row(
                  children: <Widget>[
                    Column(
                      
                        children: item3.map((item) {
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
                        children: item3.map((item) {
                      return DragTarget<ItemAnimal>(
                        onAccept: (receivedItem) {
                          if (item.value == receivedItem.value) {
                            setState(() {
                              item3.remove(receivedItem);
                              items33.remove(item);
                              score += 10;
                              setState(() {
                                if (item.value == "Apple") {
                                  _speak("Apple");
                                } else if (item.value == "Cat") {
                                  _speak("Cat");
                                } else if (item.value == "Banana") {
                                  _speak("Banana");
                                } else if (item.value == "Dark") {
                                  _speak("Dark");
                                }   else if (item.value == "Paint") {
                                  _speak("Paint");
                                } else if (item.value == "Face") {
                                  _speak("Face");
                                } else if (item.value == "Ear") {
                                  _speak("Ear");
                                } else if (item.value == "Tail") {
                                  _speak("Tail");
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
                ),*/]))));}
             else if (gameOver)
              {
                saveScore(score, time_now);
      return Scaffold(
          backgroundColor: Colors.blueGrey[100],
         /* appBar: AppBar(
            backgroundColor: Color(0xff01a3a4),
            centerTitle: true,
            title: Text(language ? " تعلم الكلمات" : 'learn words',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            leading: IconButton(
              icon: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  initGame();
                  _timer.cancel();
                 // Navigator.of(context).pushNamed('Gamenumberequation');
                },
              ),
              onPressed: () {
                initGame();
                _timer.cancel();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamesubMathcing()
                  ),
                );
              },
            ),
          ),*/
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              SizedBox(
                height: 200,
              ),
              Text(
                language ? "نتيجتك $score" : "Your $score",
                style: TextStyle(
                  color: Colors.purpleAccent[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                language
                    ? "الوقت المستهلك $time_now ثواني"
                    : "Time you Take $time_now Seconds",
                style: TextStyle(
                  color: Colors.purpleAccent[100],
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                score == 80 && time_now < 25
                    ? language ? "👑💯/💯👑😁 متميز " : "Special 👑💯/💯👑😁"
                    : checkmod(score, time_now),
                style: TextStyle(
                  color: Colors.purpleAccent[100],
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
                  child: Text(language ? "لعبة جديدة" : "New Game"),
                  onPressed: () {
                    setState(() {
                      initGame();
                      //Navigator.of(context).pushNamed("GamesubMathcing");
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDDAnimaleMatching()
                  ),
                );
                      
                    });
                  },
                ),
              )
            ]),
          ));
  }
  }}

AudioCache plyr = AudioCache();

class ItemAnimal {
  final String name;
  final String value;
  final AssetImage image;
  final IconData icon;

  bool accepting;

  ItemAnimal({this.name, this.value,this.image, this.icon, this.accepting = false});
}
