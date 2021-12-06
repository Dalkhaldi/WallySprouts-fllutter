import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
//import 'colorsectionChildren.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//مشكلة بالوقت
class GameMatchingColors extends StatefulWidget {
  GameMatchingColors({Key key}) : super(key: key);

  createState() => GameDDFruiteState();
}

class GameDDFruiteState extends State<GameMatchingColors> {
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

  Future saveScore(int score1, int time_now1) async {
    if (score1 == 7 && time_now1 < 15) {
      scoreDB = 10;
    } else if (score1 == 7 && time_now1 < 20) {
      scoreDB = 9;
    } else if ((score1 == 6 || score1 == 5) && time_now1 < 60) {
      scoreDB = 8;
    } else if (score1 == 4 && time_now1 < 120) {
      scoreDB = 7;
    } else if (score1 == 0) {
      scoreDB = 0;
    } else if (score1 <= 3 && time_now1 < 180) {
      scoreDB = 5;
    } else {
      scoreDB = 0;
    }
    var data = {
      "score": "$scoreDB",
      "score_in": "GameMatchingColors",
      "id_for_child": childID,
    };
    var url = "http://192.168.2.102:8010/GProject/childrenScores.php";
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
  final Map<String, bool> score = {};
  String checkresult(int score1, int time_now1) {
    if (score1 == 7 && time_now1 < 15) {
      scoreDB = 10;
      score.clear();
      return language ? "متميز 👑😁" : "Special 👑😁"; //
    } else if (score1 == 7 && time_now1 < 20) {
      scoreDB = 9;
      score.clear();
      return language ? "ممتاز 👑😁" : "Excellent 👑😁"; //
    } else if ((score1 == 6 || score1 == 5) && time_now1 < 60) {
      scoreDB = 8;
      score.clear();
      return language ? "  😊 جيد جدا" : "Very Good 😊"; //
    } else if (score1 == 4 && time_now1 < 120) {
      scoreDB = 7;
      score.clear();
      return language ? " 🙂 جيد" : "Good 🙂"; //
    } else if (score1 <= 2) {
      scoreDB = 0;
      score.clear();
      return language
          ? " 🙁 لقد خسرت حاول مره  اخرى "
          : "You lose, try again🙁";
    } else if (score1 == 3 && time_now1 < 180) {
      scoreDB = 5;
      score.clear();
      return language ? " 🙂مقبول " : "Acceptable 🙂";
    } else {
      scoreDB = 0;
      score.clear();
      return language
          ? " 🙁 لقد خسرت حاول مره  اخرى "
          : "You lose, try again🙁";
    }
  }

  bool gameOver;
  FlutterTts flutterTts;
  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setVolume(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
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

  @override
  void initState() {
    super.initState();

    getpref1();
    getpref();
    initTts();
    timer_counter();
    result = 0;
    time_now = 0;
    score.clear();

    temp++;
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

  final Map choices = {
    '☘️': Colors.green,
    '⭐️': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '💼': Colors.brown,
    '🥕': Colors.orange,
    '🐳': Colors.blue,
  };

  Future _speak(String t) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
  }

  int temp = 0;
  int result = 0;
  @override
  Widget build(BuildContext context) {
    if (time_now == 180) {
      _timer.cancel();
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff01a3a4),
            leading: IconButton(
              icon: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  _timer.cancel();

                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => colorsectionChildren(
                        flage: language,
                      ),
                    ),
                  );*/
                },
              ),
              onPressed: () {
                _timer.cancel();
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => colorsectionChildren(
                      flage: language,
                    ),
                  ),
                );*/
              },
            ),
            title: Text(
              ' ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
              child: Column(children: [
            SizedBox(
              height: 200,
            ),
            Text(
              language
                  ? "🙁لقد  خسرت , حاول مره اخرى"
                  : "You are lose, try again🙁",
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
              language ? "$result" + " : النتيجة " : "Score: $result",
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
              language
                  ? "ثواني $time_nowالوقت المستهلك"
                  : "Time you Take $time_now Seconds",
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
                child: Text(language ? "لعبة جديدة" : "New Game"),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed("GameMatchingColors");
                  });
                },
              ),
            )
          ])));
    }
    if (score.length < 7)
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _timer.cancel();
                result = 0;
                time_now = 0;
                score.clear();

                temp++;
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => colorsectionChildren(
                      flage: language,
                    ),
                  ),
                );*/
              },
            ),
            onPressed: () {
              _timer.cancel();
             /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => colorsectionChildren(
                    flage: language,
                  ),
                ),
              );*/
            },
          ),
          title: Text(language
              ? "   الوقت :" + "  $time_now النتيجة : $result"
              : 'Score $result    Time: $time_now'),
          backgroundColor: Color(0xff01a3a4),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              result = 0;
              time_now = 0;
              score.clear();

              temp++;
            });
          },
        ),
        body: Container(
          height: 1000,
          child: ListView(children: [
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: choices.keys.map((emoji) {
                      return Container(
                        height: 80,
                        child: Draggable<String>(
                          data: emoji,
                          child:
                              Emoji(emoji: score[emoji] == true ? '☑️' : emoji),
                          feedback: Emoji(emoji: emoji),
                          childWhenDragging: Emoji(emoji: '🐝'),
                        ),
                      );
                    }).toList()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: choices.keys
                      .map((emoji) => _buildDragTarget(emoji))
                      .toList()
                        ..shuffle(Random(temp)),
                )
              ],
            ),
          ]),
        ),
      );
    if (score.length == 7) {
      saveScore(result, time_now);
      _timer.cancel();
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _timer.cancel();
                result = 0;
                // time_now = 0;
                // score.clear();

                temp++;
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => colorsectionChildren(
                      flage: language,
                    ),
                  ),
                );*/
              },
            ),
            onPressed: () {
              _timer.cancel();
              result = 0;
              time_now = 0;
              score.clear();

              temp++;
             /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => colorsectionChildren(
                    flage: language,
                  ),
                ),
              );*/
            },
          ),
          title: Text(' '),
          backgroundColor: Color(0xff01a3a4),
        ),
        body: Container(
            height: 1000,
            child: Column(children: [
              SizedBox(
                height: 200,
              ),
              Text(
                language ? " $result :النتيجة" : "Result : $result",
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
                language
                    ? " الوقت المستهلك $time_now ثانية  "
                    : "$time_now Seconds" + "From Time you Take",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                result == 7 && time_now < 15
                    ? language ? " مميز 👑💯/💯👑😁" : "Special 👑💯/💯👑😁"
                    : checkresult(result, time_now),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xff01a3a0),
                  child: Text(language ? "لعبة جديدة" : "New Game"),
                  onPressed: () {
                    setState(() {
                      result = 0;
                      time_now = 0;
                      score.clear();

                      temp++;
                      Navigator.of(context).pushNamed("GameMatchingColors");
                    });
                  },
                ),
              )
            ])),
      );
    }
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text(language ? "!جيد " : 'Good !'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          setState(() {
            if (choices[emoji] == Colors.green) {
              language ? _speak("اخضر") : _speak("Green");
            } else if (choices[emoji] == Colors.yellow) {
              language ? _speak("اصفر") : _speak("Yellow");
            } else if (choices[emoji] == Colors.red) {
              language ? _speak("احمر") : _speak("Red");
            } else if (choices[emoji] == Colors.blue) {
              language ? _speak("ازرق") : _speak("Blue");
            } else if (choices[emoji] == Colors.orange) {
              language ? _speak("برتقالي") : _speak("Orange");
            } else if (choices[emoji] == Colors.brown) {
              language ? _speak("بني") : _speak("Brown");
            } else {
              language ? _speak("أرجواني") : _speak("Purple");
            }
          });
          result += 1;
        });
      },
      onLeave: (data) {
        setState(() {
          result -= 1;
        });
      },
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}
