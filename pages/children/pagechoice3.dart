import 'dart:convert';
import 'dart:async' show Future;
//import 'package:GProject/widgets/tile_card_Animals.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
 
 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/children/color.dart';
import 'package:wallysprouts/pages/children/header.dart';

class AnimalsScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  AnimalsScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _animalsState createState() => _animalsState();
}

class _animalsState extends State<AnimalsScreen> {
  int _selectedIndex;

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

  List<AnimalsList> item = [
    AnimalsList(address: "assets/Goat3.svg", word: "Goat", audio: "goat.mp3"),
    AnimalsList(
        address: "assets/cheetah.svg", word: "Cheetah", audio: "cheetah.mp3"),
    AnimalsList(
        address: "assets/tortoise1.svg",
        word: "Tortoise",
        audio: "tortoise.mp3"),
    AnimalsList(address: "assets/crab.svg", word: "Crab", audio: "crab.mp3"),
    AnimalsList(address: "assets/cat.svg", word: "Cat", audio: "cat.mp3"),
    AnimalsList(
        address: "assets/rabbit.svg", word: "Rabbit", audio: "hare.mp3"),
    AnimalsList(
        address: "assets/Monkey.svg", word: "Monkey", audio: "monkey.mp3"),
    AnimalsList(
        address: "assets/elf.svg", word: "Elephant", audio: "elephant.mp3"),
    AnimalsList(address: "assets/ow.svg", word: "Owl", audio: "owl.mp3"),
    AnimalsList(address: "assets/snak.svg", word: "Snake", audio: "snake.mp3"),
    AnimalsList(address: "assets/mouse.svg", word: "Mouse", audio: "mouse.mp3"),
    AnimalsList(address: "assets/horse.svg", word: "Horse", audio: "horse.mp3"),
    AnimalsList(address: "assets/lion.svg", word: "Lion", audio: "lion.mp3"),
    AnimalsList(address: "assets/deer.svg", word: "Deer", audio: "deer.mp3"),
    AnimalsList(address: "assets/doog.svg", word: "Dog", audio: "dog.mp3"),
  ];
  List<AnimalsList> itemAR = [
    AnimalsList(address: "assets/Goat3.svg", word: "ماعز", audio: "goat.mp3"),
    AnimalsList(
        address: "assets/cheetah.svg", word: "الفهد", audio: "cheetah.mp3"),
    AnimalsList(
        address: "assets/tortoise1.svg",
        word: "Tortoise",
        audio: "tortoise.mp3"),
    AnimalsList(address: "assets/crab.svg", word: "سلطعون", audio: "crab.mp3"),
    AnimalsList(address: "assets/cat.svg", word: "قط", audio: "cat.mp3"),
    AnimalsList(address: "assets/rabbit.svg", word: "أرنب", audio: "hare.mp3"),
    AnimalsList(address: "assets/Monkey.svg", word: "قرد", audio: "monkey.mp3"),
    AnimalsList(address: "assets/elf.svg", word: "فيل", audio: "elephant.mp3"),
    AnimalsList(address: "assets/ow.svg", word: "بومة", audio: "owl.mp3"),
    AnimalsList(address: "assets/snak.svg", word: "ثعبان", audio: "snake.mp3"),
    AnimalsList(address: "assets/mouse.svg", word: "الفأر", audio: "mouse.mp3"),
    AnimalsList(address: "assets/horse.svg", word: "حصان", audio: "horse.mp3"),
    AnimalsList(address: "assets/lion.svg", word: "أسد", audio: "lion.mp3"),
    AnimalsList(address: "assets/deer.svg", word: "الغزال", audio: "deer.mp3"),
    AnimalsList(address: "assets/doog.svg", word: "كلب", audio: "dog.mp3"),
  ];
  static AudioCache _player = AudioCache();
  // static const _audioPath = "Test2.mp3";
  AudioPlayer _audioPlayer = AudioPlayer();


  Future _speak(String t) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
  }

  Future _speakAR(String t) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(t);
  }

  Future<AudioPlayer> playAudio(String p) async {
    return _player.play(p);
  }

  void _stop() {
    if (_audioPlayer != null) {
      _audioPlayer.stop();
    }
  }

  List<dynamic> listsearch1 = [];
  Future viewallusers() async {
    var data = {
      "id": "1",
    };
    var url = "http://192.168.2.103:8010/GProject/viewallusers.php";
    var response = await http.post(url, body: data);
    var responsebody = json.decode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch1.add(responsebody[i]['username']);
    }
    return responsebody;
  }
 @override
  void initState() {
    super.initState();
    getpref();
       initTts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title: widget.title,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: viewallusers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                        /*  child: tile_card_Animals(
                            isActive: _selectedIndex == index,
                            pic: item[index].address,
                            name: language
                                ? itemAR[index].word
                                : item[index].word, //w
                            textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _stop();
                              language
                                  ? _speakAR(itemAR[index].word)
                                  : _speak(item[index].word); //w
                              playAudio(item[index].audio).then((player) {
                                _audioPlayer = player;
                              });
                            },
                          ),*/
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class AnimalsList {
  final String address;
  final String word;
  final String audio;

  AnimalsList({this.address, this.word, this.audio});
}
