import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
import 'package:wallysprouts/pages/children/Blettergames/letterb.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';
import 'package:flutter/rendering.dart';
class LettersPage extends StatefulWidget {
   

  @override
  _LettersPageState createState() => _LettersPageState();
}
class _LettersPageState extends State<LettersPage> {
   
  @override
  Widget build(BuildContext context) {
    //EdgeInsets devicePadding = MediaQuery.of(context).padding;
    
    return Scaffold(
        appBar:AppBar(
       // elevation: 100,
           centerTitle: true,
           backgroundColor:Colors.white,
           leading: IconButton(icon: Icon(Icons.arrow_back_ios), 
           onPressed: (){
                  // Navigator.of(context).pushNamed('welcome');  
 Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => abcdsectionchildren(flage: false,
               
            ),
          ),
        );

           }
           ,color:Colors.black,iconSize: 35.0,hoverColor: Colors.black),
            actions: <Widget>[
              //IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){},color:Colors.white,iconSize: 35.0)
            ] ,
          // leading: IconButton(color:Colors.white, icon:Icon(Icons.arrow_back_ios), hoverColor: Colors.black,onPressed:null, iconSize: 35.01s),
           title:Text("Letters",style:
           TextStyle(color:Colors.black,
           fontFamily: 'DancingScript',
           fontSize: 35.0 ))),
         
      //  backgroundColor: Color.fromRGBO(38,50,56,1),

      body: ListView(
        children:<Widget> [
          getdatapage('1',"bigLetter-A-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter A",Colors.orange.shade300),
           getdatapage('2',"bigLetter-B-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter B",Colors.teal.shade300),
           getdatapage('3',"bigLetter-C-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter C",Colors.purple.shade300),
           getdatapage('4',"bigLetter-D-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter D",Colors.redAccent),
           getdatapage('5',"bigLetter-E-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter E",Colors.orange.shade300),
           getdatapage('6',"bigLetter-F-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter F",Colors.teal.shade300),
           
           getdatapage('7',"bigLetter-G-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter G",Colors.orange.shade300),
           getdatapage('8',"bigLetter-H-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter H",Colors.purple.shade300),
           getdatapage('1',"bigLetter-I-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter I",Colors.redAccent),
           getdatapage('1',"bigLetter-J-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter G",Colors.orange.shade300),
           getdatapage('1',"bigLetter-K-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter K",Colors.teal.shade300),
           getdatapage('1',"bigLetter-L-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter L",Colors.purple.shade300),
           getdatapage('1',"bigLetter-M-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter M",Colors.redAccent),
           getdatapage('1',"bigLetter-N-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter N",Colors.orange.shade300),
           getdatapage('1',"bigLetter-O-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter O",Colors.teal.shade300),
           getdatapage('1',"bigLetter-P-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter P",Colors.purple.shade300),
           getdatapage('1',"bigLetter-Q-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter Q",Colors.redAccent),
           getdatapage('1',"bigLetter-R-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter R",Colors.orange.shade300),
           getdatapage('1',"bigLetter-S-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter S",Colors.teal.shade300),
           getdatapage('1',"bigLetter-T-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter T",Colors.purple.shade300),
           getdatapage('1',"bigLetter-U-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter U",Colors.redAccent),
           getdatapage('1',"bigLetter-V-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter V",Colors.orange.shade300),
           getdatapage('1',"bigLetter-W-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter W",Colors.teal.shade300),
           getdatapage('1',"bigLetter-X-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter X",Colors.purple.shade300),
           getdatapage('1',"bigLetter-Y-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter Y",Colors.redAccent),
           getdatapage('1',"bigLetter-Z-icon.png","Lets Go and learn about "+'\t''\t''\n'+"letter Z",Colors.orange.shade300),
           
        ],
      ),);
  }
  String value;
      Container getdatapage(id,image,text,color)
      {
        setState(() {
          value=id;
          print(id);
        });
        return Container(
          
        child:GestureDetector(
          onTap: (){
                if(id=='1') 
                {
                   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dragabc(
               
            ),
          ),
        );}
        else if(id=='2') 
                {
                   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DragabcB(
               
            ),
          ),
        );
                }
          },
          child:Container(
            
      height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: color,
        
      ),
      margin: EdgeInsets.only(left:85,right:15,top:25),
      child:Stack(
        children:<Widget> [
          Positioned(
            left:-65,
            child:Padding(
              padding: const EdgeInsets.all(10),
               child:Image(
                 image:AssetImage('assets/$image'),
                 height: MediaQuery.of(context).size.height/4.5
               )
            )
          ),
          Container(
            child:Column(
              children:<Widget>[
                Row(
                  children:<Widget>[
                     Container(
                     child:Text(
                      text,
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 22,
                         fontFamily:'DancingScript',
                       ),
                     ),
                    margin:EdgeInsets.only(left:100,top:20)
                     )

                  ]
                )
              ]
            )
             )
        ],
        overflow:Overflow.visible ,
      )
       )
      ));}
                    
  }



