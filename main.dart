//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallysprouts/pages/children/Blettergames/letterb.dart';
import 'package:wallysprouts/pages/children/arabAgame/dragaraba.dart';
 
import 'package:wallysprouts/pages/children/cardleter.dart';
import 'package:wallysprouts/pages/children/childfirstpage.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
 
import 'package:wallysprouts/pages/children/flipcardgame/homecard.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
import 'package:wallysprouts/pages/children/Alettergames/dragalpha.dart';
import 'package:wallysprouts/pages/children/Alettergames/wordsA.dart';
import 'package:wallysprouts/pages/other/homestart.dart';
import 'package:wallysprouts/pages/other/fammily.dart';
import 'package:wallysprouts/pages/social/chatsystem/chat_main.dart';
import 'package:wallysprouts/pages/social/chatsystem/settings.dart';
import 'package:wallysprouts/pages/social/comment.dart';
import 'package:wallysprouts/pages/social/frendsProfile.dart';
import 'package:wallysprouts/pages/social/social_home.dart';
import 'package:wallysprouts/pages/social/social_profile.dart';
import 'package:wallysprouts/pages/social/social_search.dart';
import 'package:wallysprouts/pages/children/games/jumbBox/box_main.dart';
import 'package:wallysprouts/pages/children/games/trisGame/main_tetris.dart';
import 'package:wallysprouts/pages/children/games/snake.dart';
import 'package:wallysprouts/pages/children/games/tic_tac_toe/main_tic.dart';
import './pages/Login.dart';
import './pages/Users.dart';
import 'pages/verify_email.dart';
import './pages/welcome.dart';
import './pages/Reset_password.dart';
import './pages/liquid_swipe.dart';
import './pages/signup.dart';
import './pages/login_admin.dart';
import './pages/insertkey.dart';
import './pages/social/social_basic.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
//import'./pages/Logi';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 runApp(Myapp());
}

class Myapp extends StatelessWidget {
  var keys;
  var email;
  var title;
  var i=0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wally Sprouts',
      theme: ThemeData(
         
        primarySwatch: Colors.blue,
      ),
       home:ChangeNotifierProvider(
        create: (context) => Data(),
        child: TetrisGame(),
      ),//HomePagestart(),//HomePagestart(),//Socialbasic(0),//MyAppchat(),//MyAppchat(),//HomePage(),//GameMain(), //CountingScreen(),//Tictactoe(),
      /* ChangeNotifierProvider(
        create: (context) => Data(),
        child: TetrisGame(),
      ),*//////////must use when run tetris
    //TetrisGame(),//MyAppsnacke(),//GameMain(),//Dragabcarab(),//Dragalef(),//DragabcB(),//HomePage(),//Dragabc(),////CountingScreen(),////Dragwords(),,//GameDDpic(),//GameDDAnimaleMatching(), // Childrvideo(),//Socialbasic(0),//LoginScreen(), //Socialbasic(0),
      routes: {
        'welcome': (context) {
          return Welcome();
        },
        'users': (context) {
          return UsersPage();
        },
        'liquid_swipe': (context) {
          return MyliquidSwipe();
        },
        'signup': (context) {
          return SignupScreen();
        },
        'Login': (context) {
          return LoginScreen();
        },
        'verify_email': (context) 
        {
          return EmailPage();
        },
        'Reset_password': (context) {
          return PasswordPage(this.email);
        },
        'loginAdmin': (context) {
          return  LoginAdminScreen();
        },
        'social_home': (context) {
          return  Socialbasic(this.i);
        },
          'key': (context) {
          return  KeyPage(this.keys,this.email);
        },
        'search': (context) {
          return  Search();
        },
        'profile': (context) {
          return  ProfilePage();
        },
        'comment': (context) {
          return  Comment(i);
        },
        'prof': (context) {
          return   FrendPage("1","deaa","1","deaa","1");
        },
        'video': (context) {
          return   Childrvideo( );
        },
        'home': (context) {
          return  HomePagestart( );
        },
        'fammily': (context) {
          return  familyside( );
        },
        'childe': (context) {
          return   Welcomechilde( );
        },
        
         
        
       
      },/*Scaffold(
        
         appBar:AppBar(
        elevation: 100,
           centerTitle: true,
           backgroundColor:Color.fromRGBO(215,53,88,1.0),
           leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0,hoverColor: Colors.black),
            actions: <Widget>[
              //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
            ] ,
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
           title:Text("Wally Sprouts",style:
           TextStyle(color:Colors.white,
           fontFamily: 'DancingScript',
           fontSize: 30.0 ))),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38,50,56,1),*/
       // body:PasswordPage()
        
        
         

      );
    //);
  }
}


 
  
  
