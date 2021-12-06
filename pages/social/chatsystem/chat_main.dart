//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/social/chatsystem/home.dart';
import 'const.dart';
import 'login.dart';

 

class MyAppchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
 // prefs = await SharedPreferences.getInstance();

    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primaryColor: themeColor,
      ),
      
      home:HomeScreen(currentUserId:"lpsae0dcKBtc44NN9roC"), //LoginScreen(title: 'CHAT DEMO'),
      debugShowCheckedModeBanner: false,
    );
  }
}
