import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'dart:convert';
import 'package:flare_flutter/flare_actor.dart';
import 'package:http/http.dart' as http;
import 'package:wallysprouts/pages/children/pagechoice2.dart';

//import 'animalsectionchildren.dart';

//Done All ********************************
class GamesubMathcingb extends StatefulWidget {
  @override
  _GamesubMathcingbState createState() => _GamesubMathcingbState();
}

class _GamesubMathcingbState extends State<GamesubMathcingb> {
  List<ItemAnimal> item1;
  List<ItemAnimal> items2;
  List<ItemAnimal> itemAR;
  List<ItemAnimal> items3;
  static AudioCache _player = AudioCache();
  static const _audioPath = "success.mp3";
  AudioPlayer _audioPlayer = AudioPlayer();
String animationType = "idle";
  Future<AudioPlayer> playAudio() async {
    return _player.play(_audioPath);
  }

  void _stop() {
    if (_audioPlayer != null) {
      _audioPlayer.stop();
    }
  }

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
      "score_in": "wordletter",
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

  int scoreDB = 0;

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

  int score;
  bool gameOver = false;
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
    getpref();
    getpref1();
    timer_counter();
    initGame();
    initTts();
  }

  Future _speak(String t) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
  }

  Future _speakAR(String t) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("ar");
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

  var rng = new Random();

  List<String> result0 = [
    "__ack",
    "__aby",
    "__akery",
    "__alance",
    "__all",
    "__allon",
    "__ox",
    "__ank",
    "__asket",
    "__attery",
    "__eak",
    "__ear",

   /* "Ad__pt",
    "__ack",
    "Basket__all =",
    "__at",
    " __ain",
    "__ame",
    "B_d =",
    "__eaf",
    "Mea__",
    "__ead",
    "Bear__"*/
  ];

  List<String> result3 = [
    "Bar__ecue",
    "Base__all",
    "Basket__all",
    "A__road",
    "Alpha__et",
    "A__stain",
    "Accessi__le",
    "A__andon",
    "A__domen",
    "A__use",
    "A__ove",
    "Availa__le"
  ];

  List<String> result6 = [
    "__abbit",
    "__ace",
    "__adio",
    "__ain",
    "__ainbow",
    "__aisins",
    "__each",
    "__ead",
    "__ectangle",
    "__elax",
    "__oar",
    "__attle"
  ];

  List<String> result8 = [
    "Accela__ation",
    "A__ea",
    "Acc__ue",
    "Ac__oss",
    "Acto__",
    "Add__ess",
    "Ado__e",
    "Adve__se",
    "Af__aid",
    "Afte__noon",
    "Ag__ee",
    "Ai__plane"
  ];
  List<String> result50 = [
    "__aily",
    "__anger",
    "__ance",
    "__amage",
    "__ark",
    "__ay", 
    "__eaf",
    "__aughter",
    "__ecoration",
    "__elicate",
    "__emand",
    "__epart"
  ];
  List<String> result65 = [
    "Ab__omen",
    "Acci__ent",
    "Accrue__",
    "A__apt",
    "A__opt",
    "A__ore", 
    "A__mission",
    "Almon__s",
    "Amaze__",
    "Attache__",
    "Afrai__",
    "A__justment"
  ];

  List<String> result00 = [
    "٢-٢ =",
    "٦-٦ =",
    "٨-٨ =",
    "٤٥-٤٥ =",
    "٥٥-٥٥ =",
    "٩٠-٩٠ =",
    "٢٨-٢٨ =",
    "٦٤-٦٤ =",
    "٨٧-٨٧ =",
    "٢٤-٢٤ =",
    "٦٣-٦٣ =",
    "١٠٠-١٠٠ ="
  ];

  List<String> result33 = [
    "٢ - ٥ =",
    "٦ -٩ =",
    "٥ - ٨ =",
    "٣٧ - ٤٠ =",
    "٢٩٧ - ٣٠٠ =",
    "٢١٤ - ٢١٧ =",
    "٢٥ - ٢٨ =",
    "٦١ - ٦٤ =",
    "٧٧ - ٨٠ =",
    "٢١ - ٢٤ =",
    "٥٩ - ٦٢ =",
    "٩٧ - ١٠٠ ="
  ];

  List<String> result66 = [
    "٢ - ٨ =",
    "٣ - ٩ = ",
    "١٢ - ١٨ = ",
    "٤٤ - ٥٠ =",
    "٦٩٤ - ٧٠٠ =",
    "٢١١ - ٢١٧  =",
    "٤٢ - ٤٨ =",
    "٥٨ - ٦٤ =",
    "٧٤ - ٨٠ =",
    "١٨ - ٢٤ =",
    "٥٩ - ٦٥ =",
    "٣٢٤ - ٣٣٠ ="
  ];

  List<String> result88 = [
    "١٠ - ١٨ =",
    "٣ - ١١ =",
    "١٢ - ٢٠ =",
    "٤٢ - ٥٠ =",
    "٩٩٢ - ١٠٠٠ =",
    "٣٣٢٢ - ٣٣٣٠ =",
    "٤١٣ - ٤٢١ =",
    "٥٦ - ٦٤ =",
    "٧٧ - ٨٥ =",
    "١٦ - ٢٤ =",
    "٦١ - ٦٩ =",
    "٩٦٩ - ٩٧٧ ="
  ];
  List<String> result500 = [
    "٥٠ - ١٠٠ =",
    "١٠٠ - ١٥٠ =",
    "٤٧٥ - ٥٢٥ =",
    "١٥٠ - ٢٠٠ =",
    "٤٧٠ - ٥٢٠ =",
    "٦٠٥ - ٦٥٥ =", //
    "١٠٠٠ - ١٠٥٠ =",
    "٨٣ - ١٣٣ =",
    "٣٥ - ٨٥ =",
    "٥٠٥ - ٥٥٥ =",
    "٢٨ - ٧٨ =",
    "٥٥٠ - ٦٠٠ ="
  ];
  List<String> result655 = [
    "٣٥ - ١٠٠ =",
    "١٢٢ - ١٨٧ =",
    "٣٢ - ٩٧ =",
    "١٣٥ - ٢٠٠ =",
    "٣٢٤ - ٣٨٩ =",
    "٨٥٠ - ٩١٥ =", //
    "١٠٠٠ - ١٠٦٥ =",
    "١٠٠ - ١٦٥ =",
    "٢٠ - ٨٥ =",
    "٤٩٠ - ٥٥٥ =",
    "٤ - ٦٩ =",
    "١٣٥ - ٢٠٠ ="
  ];
  int time_now = 0;
  initGame() {
    gameOver = false;
    score = 0;
    item1 = [
      ItemAnimal(eq: result0[rng.nextInt(12)], name: "A", value: " B ", color:Colors.orange.shade300),
      ItemAnimal(eq: result3[rng.nextInt(12)], name: "a", value: " b ",color:Colors.teal.shade300),
      ItemAnimal(eq: result6[rng.nextInt(12)], name: "R", value: " R ",color:Colors.purple.shade300),
      ItemAnimal(eq: result8[rng.nextInt(12)], name: "r", value: " r ",color:Colors.redAccent),
      ItemAnimal(eq: result50[rng.nextInt(12)], name: "D", value: " D ", color:Colors.orange.shade300),
      ItemAnimal(eq: result65[rng.nextInt(12)], name: "d", value: " d ",color:Colors.teal.shade300),
    ];
    itemAR = [
      ItemAnimal(eq: result00[rng.nextInt(12)], name: "٠", value: " ٠ "),
      ItemAnimal(eq: result33[rng.nextInt(12)], name: "٣", value: " ٣ "),
      ItemAnimal(eq: result66[rng.nextInt(12)], name: "٦", value: " ٦ "),
      ItemAnimal(eq: result88[rng.nextInt(12)], name: "٨", value: " ٨ "),
      ItemAnimal(eq: result500[rng.nextInt(12)], name: "٥٠", value: " ٥٠ "),
      ItemAnimal(eq: result655[rng.nextInt(12)], name: "٦٥", value: " ٦٥ "),
    ];
    items3 = List<ItemAnimal>.from(itemAR);
    items2 = List<ItemAnimal>.from(item1); //www
    item1.shuffle(); //www
    items2.shuffle();

    itemAR.shuffle(); //www
    items3.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    
    if (false ? itemAR.length == 0 : item1.length == 0) {
      //www
      _timer.cancel();
      gameOver = true;
    }
    if (!gameOver) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            initGame();
           // Navigator.of(context).pushNamed("GamesubMathcing");
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamesubMathcingb()
                  ),
                );
          },
        ),
        backgroundColor: Colors.black,
       /* appBar: AppBar(
          backgroundColor: Color(0xff01a3a4),
          centerTitle: true,
          title: Text(language ? "لعبة الطرح" : 'Subtraction Game',
              style: TextStyle(fontSize: 30, color: Colors.white)),
          leading: IconButton(
            icon: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                initGame();
                _timer.cancel();

                ///
                Navigator.of(context).pushNamed('Gamenumberequation');
              },
            ),
            onPressed: () {
              initGame();
              _timer.cancel();
             /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => animalsectionchildren(
                    flage: language,
                  ),
                ),
              );*/
            },
          ),
        ),*/
        body: Container(
          constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage("assets/back4.png"),
             fit:BoxFit.cover
          ),
        ),
          child: Stack(
                      children:<Widget>[
                         
                        SingleChildScrollView(
                          
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
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
                   height: 0.0,
                 ),
                  /*Text.rich(TextSpan(children: [
                    // TextSpan(" ",
                    //     style: TextStyle(color: Colors.white, fontSize: 30)),
                    TextSpan(
                        text: language
                            ? "الوقت :" + "  $time_now النتيجة :$score"
                            : "Score: $score   Time : $time_now",
                        style: TextStyle(
                          color: Color(0xff01a3a4),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ))
                  ])),*/
                  if (!gameOver)
                    false
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Container(
                                  height: 400,
                                  child: Column(
                                      children: itemAR.map((item) {
                                    //www
                                    return Container(
                                        margin: const EdgeInsets.all(8.0),
                                        child: DragTarget<ItemAnimal>(
                                          onAccept: (receivedItem) {
                                            if (item.value ==
                                                receivedItem.value) {
                                              setState(() {
                                                itemAR.remove(receivedItem); //www
                                                items3.remove(item); //www
                                                score += 10;
                                                setState(() {
                                                  if (item.name == "٠") {
                                                    _speakAR("٠");
                                                  } else if (item.name == "٣") {
                                                    _speakAR("٣");
                                                  } else if (item.name == "٦") {
                                                    _speakAR("٦");
                                                  } else if (item.name == "٨") {
                                                    _speakAR("٨");
                                                  } else if (item.name == "٥٠") {
                                                    _speakAR("٥٠");
                                                  } else if (item.name == "٦٥") {
                                                    _speakAR("٦٥");
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
                                          builder: (context, acceptedItems,
                                                  rejectedItem) =>
                                              Container(
                                            color: item.accepting
                                                ? Colors.blueGrey[100]
                                                : Colors.blueGrey[200],
                                            height: 50,
                                            width: 200,
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Text(
                                                item.eq,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                          ),
                                        ));
                                  }).toList()),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Row(
                                    children: items3.map((item) {
                                  return Draggable<ItemAnimal>(
                                    data: item,
                                    childWhenDragging: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )),
                                      color: Colors.grey,
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                    feedback: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )),
                                      color: Colors.grey,
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.blueGrey),
                                      )),
                                      color: Colors.purpleAccent[50],
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                  );
                                }).toList()),
                              ),
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Container(
                                  height: 396,
                                  child: Column(
                                      children: item1.map((item) {
                                    //www
                                    return Container(
                                        margin: const EdgeInsets.all(8.0),
                                        child: DragTarget<ItemAnimal>(
                                          onAccept: (receivedItem) {
                                            if (item.value ==
                                                receivedItem.value) {
                                              setState(() {
                                                animationType="idle";
                                                item1.remove(receivedItem); //www
                                                items2.remove(item); //www
                                                score += 10;
                                                setState(() {
                                                  if (item.name == "A") {
                                                    _speak("A");
                                                    animationType="success";
                                                  } else if (item.name == "D") {
                                                    _speak("D");
                                                    animationType="success";
                                                  } else if (item.name == "R") {
                                                    _speak("R");
                                                    animationType="success";
                                                  } else if (item.name == "a") {
                                                    _speak("a");
                                                    animationType="success";
                                                  } else if (item.name == "r") {
                                                    _speak("r");
                                                    animationType="success";
                                                  } else if (item.name == "d") {
                                                    _speak("d");
                                                    animationType="success";
                                                  }
                                                });

                                                item.accepting = false;
                                               // animationType="idle";
                                              });
                                            } else {
                                              setState(() {
                                                animationType = "fail";
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
                                          builder: (context, acceptedItems,
                                                  rejectedItem) =>
                                              Container(
                                            color: item.accepting
                                                ? Colors.blueGrey[100]
                                                : Colors.blueGrey[200],
                                            height: 50,
                                            width: 200,
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Text(
                                                item.eq,
                                                style: TextStyle(
                                                    color: item.color,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.0),
                                              ),
                                            ),
                                          ),
                                        ));
                                  }).toList()),
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Row(
                                    children: items2.map((item) {
                                  //
                                  return Draggable<ItemAnimal>(
                                    data: item,
                                    childWhenDragging: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )),
                                      color: Colors.grey,
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                    feedback: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )),
                                      color: Colors.grey,
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        item.value,
                                        style: TextStyle(
                    color: item.color,
                    fontSize: 40,
                    fontFamily: 'CabinSketch',
                    fontWeight: FontWeight.bold),
                                      )),
                                      color: Colors.purpleAccent[50],
                                      height: 50.0,
                                      width: 60.0,
                                    ),
                                  );
                                }).toList()),
                              ),
                                
                   Row(
              children:<Widget> [
                Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Container(
                  height: 300,
                  width:350,

                   
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
                          )
                ],
              ),
              
            ),]
          ),
        ),
      );
    } else if (gameOver) {
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
                    builder: (context) => GamesubMathcingb()
                  ),
                );
                      
                    });
                  },
                ),
              )
            ]),
          ));
    }
  }
}

AudioCache plyr = AudioCache();

class ItemAnimal {
  final  name;
  final String value;
  final String eq;
  bool accepting;
  Color color;

  ItemAnimal({this.name, this.value, this.eq, this.accepting = false,this.color});
}
