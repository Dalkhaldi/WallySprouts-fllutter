import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
import 'package:wallysprouts/pages/children/showvideo.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wallysprouts/pages/other/chosechild.dart';

class Welcomechilde extends StatefulWidget {
  @override
  _WelcomechildeState createState() => _WelcomechildeState();
}

class _WelcomechildeState extends State<Welcomechilde>
 {
   String animationType = "idle";
   String animationType2 = "idle";
    static AudioCache _player = AudioCache();
  static const _audioPath = "Test2.mp3";
  AudioPlayer _audioPlayer = AudioPlayer();

   Future<AudioPlayer> playAudio() async {
    return _player.play(_audioPath);
  }

  void _stop(){
    if (_audioPlayer != null) {
      _audioPlayer.stop();
  }}
   @override
  void initState() {

    playAudio().then((player) {
      _audioPlayer = player;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
          
      body:Container(
         // width: 100,
         // height: ,
          
          child: Stack(
        children: <Widget>[
          Positioned.fill(
            
              child: Container(
            height: 700 ,
            width: 1200,
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1

                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO( 41, 85, 158 , 1.0),
                  Color.fromRGBO(246, 190, 234, 1.0),
                ],
              ),
            ),
              
                child: new FlareActor(
                  "assets/launching.flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: animationType2, 
                  ),
          ),
           

          ),
             

Positioned.fill(
               
            
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(onPressed: null, child: Text("HAAAAY Children I’am wally lets Go to have fun to gother" ,style:TextStyle(color:Colors.black,fontSize: 30.0,fontFamily: 'DancingScript'))
        ),
         
                      SizedBox(
  height: 350.0,
),
                     Container(
         // resizeToAvoidBottomInset:true,
          height:240,
          width: 1000,
          
        child:Center(
           child:Form(
            // key: formState,
          child: Column(
            children: <Widget>[
               Container(
            height: 200,
            width: 250,

             
                child: new FlareActor(
                  "assets/teddy_test.flr",
                 alignment: Alignment.center, 
                 fit: BoxFit.contain,
                  animation: animationType, 
                  ),
              ),
                Container(
          width: 210,
          height: 40,
          padding: EdgeInsets.only(top: 0),
          child: RaisedButton(
              color: Color(0xf00cec9),
              child: Text("..GO..", 
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>choosechild()));
                 //Navigator.of(context).pushNamed('');
              }
          ),
        ),           
         
             // backgroundColor: Colors.white,
           
           
       
            ],
          ),
           ),
        ),
        ),
        
               
       
                    ] ,
          ),
           
)],
                            )
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      ));
  }}
         
      
     