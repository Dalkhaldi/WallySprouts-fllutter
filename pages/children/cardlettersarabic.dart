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
 
class LetterarabicScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  LetterarabicScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _CountingScreenarabicState createState() => _CountingScreenarabicState();
}

class _CountingScreenarabicState extends State<LetterarabicScreen> {
  int _selectedIndex;

  List<NumList> item = [
    NumList(number: "أ", word: "One", audio: "Alf.mp3"),
    NumList(number: "ب", word: "Two", audio: "Ba.mp3"),
    NumList(number: "ت", word: "Three", audio: "Ta.mp3"),
    NumList(number: "ث", word: "Four", audio: "Tha.mp3"),
    NumList(number: "ج", word: "Five", audio: "Jem.mp3"),
    NumList(number: "ح", word: "Six", audio: "Alf.mp3"),
    NumList(number: "خ", word: "Seven", audio: "Alf.mp3"),
    NumList(number: "د", word: "Eight", audio: "Alf.mp3"),
    NumList(number: "ذ", word: "Nine", audio: "Alf.mp3"),
    NumList(number: "ر", word: "Ten", audio: "Alf.mp3"),
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
