import 'dart:convert';
import 'dart:async' show Future;
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallysprouts/pages/children/card.dart';
import 'package:wallysprouts/pages/children/color.dart';
import 'package:wallysprouts/pages/children/header.dart';
//import 'package:GProject/helper.dart';
 
class CountingScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  CountingScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  int _selectedIndex;

  List<NumList> item = [
    NumList(number: "A", word: "One", audio: "kid-a.mp3"),
    NumList(number: "B", word: "Two", audio: "kid-b.mp3"),
    NumList(number: "C", word: "Three", audio: "kid-c.mp3"),
    NumList(number: "D", word: "Four", audio: "kid-d.mp3"),
    NumList(number: "E", word: "Five", audio: "kid-e.mp3"),
    NumList(number: "F", word: "Six", audio: "kid-f.mp3"),
    NumList(number: "G", word: "Seven", audio: "kid-J.mp3"),
    NumList(number: "H", word: "Eight", audio: "kid-h.mp3"),
    NumList(number: "I", word: "Nine", audio: "kid-i.mp3"),
    NumList(number: "J", word: "Ten", audio: "kid-j.mp3"),
  ];
  static AudioCache _player = AudioCache();
  // static const _audioPath = "Test2.mp3";
  AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
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
  Future getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allpost.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    return responcebody;
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title:"Letters" ,//widget.title,
            primaryColor: Colors.blue,//widget.primaryColor,
            secondaryColor: Colors.black,//widget.secondaryColor,
          ),
          Expanded(
            child: FutureBuilder(
              future: getpost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: index % 2 == 0
                              ? const EdgeInsets.only(bottom: 20, left: 20)
                              : const EdgeInsets.only(bottom: 20, right: 20),
                          child: TileCard(
                            isActive: _selectedIndex == index,
                            title: item[index].number,
                            textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              // _playAudio(item[index].audio);
                              playAudio(item[index].audio).then((player) {
                                _audioPlayer = player;
                              });
                            },
                          ),
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
    // _soundPlayer.release();
    super.dispose();
  }
}

class NumList {
  final String number;
  final String word;
  final String audio;

  NumList({this.number, this.word, this.audio});
}
