import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallysprouts/pages/social/library.dart';
import 'package:wallysprouts/pages/social/photo.dart';
import 'package:wallysprouts/pages/social/social_basic.dart';
import 'package:wallysprouts/pages/social/video.dart';
//import 'package:photo_manager/photo_manager.dart';


class Addpost extends StatefulWidget {
   @override
  _AddpostState createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  @override
  Widget build(BuildContext context) 
  {
     return DefaultTabController(
             length: 3,
            child: Scaffold(
                /*appBar: AppBar(
             // elevation: 30,
             
             
              centerTitle: true,
              backgroundColor: Color(0xffffffff),
             leading:IconButton(
                  icon: Icon(Icons.cancel,color: Colors.black,),
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
               builder:(context)=>Socialbasic (0)));
                  },),  
                  actions: <Widget>[
            
             FlatButton(onPressed: null, child: Text("Next" ,style:TextStyle(color:Color(0xff01a3a4),fontSize: 15.0 ))
          ),
          ],
               
              // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
              //title: Text("Add Post",
                   
                      ),*/
                      bottomNavigationBar: menu(),
                     /* bottomNavigationBar: BottomNavigationBar(
                        items: [
                          BottomNavigationBarItem
                          ( 
                            icon: Icon(Icons.add,color: Colors.white,),
                            title:Text("Library" ,style:TextStyle(color:Colors.black,fontSize: 15.0 )),
                            backgroundColor: Colors.white,
                          ),
                           BottomNavigationBarItem
                          ( 
                            icon: Icon(Icons.add,color: Colors.white,),
                            title:Text("Photo" ,style:TextStyle(color:Colors.black,fontSize: 15.0 )),
                            backgroundColor: Colors.white,
                          ),
                           BottomNavigationBarItem
                          ( 
                            icon: Icon(Icons.add,color: Colors.white,),
                            title:Text("Video" ,style:TextStyle(color:Colors.black,fontSize: 15.0 )),
                             backgroundColor: Colors.white,
                          
                          ),






                        ]
                         
                        ),*/
                      body: TabBarView(children: <Widget>[
                        
                        LibraryScreen(),
                        PhotoScreen(),  
                         VideoScreen(),

                      ]),
       ),
     );
     

     
  }
  Widget menu()
  {
    return Container(
      color: Colors.white,
          child: TabBar(
                // unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  
                 tabs:<Widget> [
                  Tab(
                    text:'Library'
                      
                   
                  ),
                   Tab(
                    text:'Photo'
                  ),
                   Tab(
                    text:'video'
                  ),
                   

                 ],
                 ),
           );
  }
}
