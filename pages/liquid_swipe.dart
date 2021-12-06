import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyliquidSwipe extends StatefulWidget {
  

  @override
  _SwipeState createState() => _SwipeState();
   
  }

class _SwipeState extends State<MyliquidSwipe> {
  void signup(){
    Navigator.of(context).pushNamed('signup');
  }
   void login(){
    Navigator.of(context).pushNamed('Login');
  }
  final   page =[
 Container(
 color: Color(0xff415a77),
child:Column(
  children: <Widget>[
    
Image.asset("images/G12-Web-icon.png"),
 
Text(
"Social Media",

style:TextStyle(fontSize:40.0,
color: Colors.white,fontFamily: 'DancingScript',
)
),
 
Padding(
  padding: const EdgeInsets.all(5.0),
  child:Align(
    alignment:  Alignment.center,
    child: Text(
    "Share your experiences and post your inquiries about children, interact  and be in  contact with others. "'\n'"Offer support and receive help, be close. ",
    style: TextStyle(
               fontSize:20.0,
               color:Colors.white,

    ),
    
    ))),
    SizedBox(
                   height: 1.0,
                 ),
     ]
                 ),
                 
                  ),
                  Container(
                 
                    color: Color(0xff386641),
                    child:Column(
                   children: <Widget>[
                     
                 Image.asset("images/G12-Map-icon.png"),
                 Text(
                 "Locations",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.white,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height: 24.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "Keep track of the entertainment, educational and health places around you to know the right place for your child faster ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.white,
                 
                     ),
                     
                     ))),
                     SizedBox(
                   height: 23.0,
                 ),
                   
                 
                   ]
                 ),
                 
                 
                  ),
                  Container(
                    color: Color(0xffffb4a2),
                 child:Column(
                   children: <Widget>[
                     
                 Image.asset("images/G12-Folder-Doc-icon.png"),
                 Text(
                 "Articles",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.black,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height:  0.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "You can view scientific articles specialized in different aspects related to children that help you to access diverse and reliable information about your child from one place. ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.black,
                 
                     ),
                     
                     ))),
                     SizedBox(
                   height:1.0,
                 ),
                  
                 
                   ]
                 ),
                 
                 
                  ),
                  Container(
                    color: Color(0xffcaffbf),
                    child:Column(
                   children: <Widget>[
                     
                 Image.asset("images/G12-3D-icon.png"),
                 Text(
                 "Childrens Side",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.black,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height:  0.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "Offer your child fun and knowledge, choose appropriate stories and videos, and let him spend his time meaningfully ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.black,
                 
                     ),
                     
                     ))),SizedBox(
                   height:  47.0,
                 ),
                    
                 
                   ]
                 ),
                 
                 
                  ),
                  Container(
                    color: Color(0xfffdffb6),
                    child:Column(
                   children: <Widget>[
                     
                 Image.asset("images/G12-Folder-Photos-icon.png"),
                 Text(
                 "Gallery",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.black,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height:  0.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "Save children's memories with text sentences to describe the image, and let them share that with their voices to describe their memories in their own way. ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.black,
                 
                     ),
                     
                     ))),SizedBox(
                   height: 24.0,
                 ),
                   
                 
                   ]
                 ),
                 
                 
                  ),
                  Container(
                    color: Color(0xffe5b3fe),
                 child:Column(
                   children: <Widget>[
                     
                 Image.asset("images/G12-Photos-2-icon.png"),
                 Text(
                 "Highest Scorse",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.black,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height:  0.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "Let's make it more excited! Let the children test the educational skills they have acquired, share their results, and be aware of the results of others ... Make your child always first. ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.black,
                 
                     ),
                     
                     ))),SizedBox(
                   height: 1.0,
                 ),
                 
                   ]
                 ),
                 
                  ),
                  Container(
                    color: Color(0xbdb2ff),
                 child:Column(
                   children: <Widget>[
                      Container(
                           width: 300,
                           height: 40,
                           padding: EdgeInsets.only(top:5),
                           child: IconButton(
                                 icon: Icon(Icons.arrow_back_ios),
                                 onPressed: () {
                                  // Navigator.of(context).pushNamed('signup');
                                 },
                                 color: Colors.white,
                                 iconSize: 35.0,
                                 hoverColor: Colors.black)
                           
                         ),     
                 Image.asset("images/G12-Mail-icon.png"),
                 Text(
                 "Events",
                 
                 style:TextStyle(fontSize:40.0,
                 color: Colors.black,fontFamily: 'DancingScript',
                 )
                 ),
                 SizedBox(
                   height:  0.0,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:Align(
                     alignment:  Alignment.center,
                     child: Text(
                     "Organize events for kids, send invitations to the app users you want and make the fun greater . ",
                     style: TextStyle(
                                fontSize:20.0,
                                color:Colors.black,
                 
                     ),
                     
                     ))),
                     
                   
                 
                   ]
                 ),
                 
                  ),
                  
                 
                 
                 
                 
                 ];
                  
                   @override
                   Widget build(BuildContext context) {
                     // TODO: implement build
                    return Scaffold(
                            
                 body:Container(
                  height: 800 ,
            width: 1200,
                   child: Stack(
        children: <Widget>[
           
          Positioned.fill(
child: Container(
          //  height: 700 ,
            width: 1200,
             
                   
            //height: 700 ,
            //width: 1200,
                  child: LiquidSwipe(
                   pages: page,
                   enableSlideIcon: true,
                   
                 ),

                   



          )),
          Container(
            padding: EdgeInsets.only(top: 15),
          child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed('users');
                }
                   
             )),
           

           /*Positioned.fill(
child: Container(
            //height: 1 ,
            //width: 1200,
             child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pushNamed('users');
                }
                   
             )

                   



          )),*/
          
          Positioned.fill(
  
             
                  
                child: Column(
                  
                     mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                       
         
                      SizedBox(
  height: 590.0,
),
                     Container(
         // resizeToAvoidBottomInset:true,
          height:90,
          width: 400,
          
        child:Center(
           child:Form(
            // key: formState,
          child: Column(
            children: <Widget>[
               
                Container(
         width: 210,
          height: 40,
          padding: EdgeInsets.only(top: 0),
          child: RaisedButton(
              color: Colors.grey,
              child: Text("LOG IN", 
              style: TextStyle(color: Colors.white, fontSize: 20.0),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                 Navigator.of(context).pushNamed('Login');
              }
          ),
        ), 
        SizedBox(
  height: 15.0,
),
//Text("dont have an account"),
             Container(
                child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'signup');
            },
                      child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 17),
                      )
                    ]),
              ),
            ),
          )
                         
        ),
          
         
             // backgroundColor: Colors.white,
           
           
       
            ],
          ),
           ),
        ),
        ),
        
               
       
                    ]),
          ),
          
          
          ]))
              
                 
                 
                 
                 
                    );
                  
                   }
                 
                    
}
 