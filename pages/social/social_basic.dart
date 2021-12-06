import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallysprouts/pages/social/addpost.dart';
import 'package:wallysprouts/pages/social/social_home.dart';
import 'package:wallysprouts/pages/social/social_profile.dart';
import 'package:wallysprouts/pages/social/social_search.dart';
 

 
class Socialbasic extends StatefulWidget {
  var i;
  Socialbasic(this.i);
  @override
  _SocialbasicState createState() => _SocialbasicState(i);
}

class _SocialbasicState extends State<Socialbasic> {
var i;
 _SocialbasicState(this.i);
 // int _page = 0;
var _pages = [
    Home(),//for home
   Search(),//for search
   Home(),// Addpost(),//for add post
   Home(),//for notefication and fllowers
   ProfilePage(),//for profile
  ];
 int currentPage  ;
  



  @override
  Widget build(BuildContext context) {
     currentPage = i ;
    // TODO: implement build
    return Scaffold (
      
                    
                    body:_pages[currentPage],
                    
                    bottomNavigationBar: CurvedNavigationBar(
                    
          items: <Widget>[
            
            Icon(Foundation.home, size: 30),
            Icon(Feather.search, size: 30),
           // Icon(Feather.plus_square, size: 30),
           IconButton(
                icon: Icon(Feather.plus_square),
                onPressed: () {
                 // Navigator.of(context).pushNamed('Addpost');
                 Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Addpost();
                               }));
                },
                
                color: Colors.black,
                iconSize: 30.0,
                hoverColor: Colors.black),
             
            Icon(Feather.heart, size: 30),
            Icon(Feather.user, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xff01a3a4),
           
          animationCurve: Curves.easeOutQuad,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              i=index;
              currentPage = index;
              print(index);
            });
          },
        ),
         
    );
  }





}