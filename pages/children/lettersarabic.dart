import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
 import 'package:wallysprouts/pages/children/Blettergames/letterb.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';
 import 'package:wallysprouts/pages/children/arabAgame/dragaraba.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LettersarabPage extends StatefulWidget {
   

  @override
  _LettersarabPageState createState() => _LettersarabPageState();
}
class _LettersarabPageState extends State<LettersarabPage> {
   
  @override
  Widget build(BuildContext context) {
    //EdgeInsets devicePadding = MediaQuery.of(context).padding;
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
          getdatapage('1',"أ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters" ,Colors.orange.shade300,Colors.redAccent),
           getdatapage('2',"ب",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.greenAccent),
           getdatapage('3',"ت",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.blueGrey),
           getdatapage('4',"ث",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.orange.shade300),
           getdatapage('5',"ج",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.redAccent),
           getdatapage('6',"ح",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.greenAccent),
           
           getdatapage('7',"خ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.blueGrey),
           getdatapage('8',"د",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.orange.shade300),
           getdatapage('1',"ذ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.redAccent),
           getdatapage('1',"ر",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.greenAccent),
           getdatapage('1',"ز",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.blueGrey),
           getdatapage('1',"س",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.orange.shade300),
           getdatapage('1',"ش",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.redAccent),
           getdatapage('1',"ض",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.greenAccent),
           getdatapage('1',"ط",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.blueGrey),
           getdatapage('1',"ظ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.orange.shade300),
           getdatapage('1',"ع",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.redAccent),
           getdatapage('1',"غ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.greenAccent),
           getdatapage('1',"ف",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.blueGrey),
           getdatapage('1',"ق",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.orange.shade300),
           getdatapage('1',"ك",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.redAccent),
           getdatapage('1',"ل",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.greenAccent),
           getdatapage('1',"م",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.teal.shade300,Colors.blueGrey),
           getdatapage('1',"ن",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.purple.shade300,Colors.orange.shade300),
           getdatapage('1',"و ",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.redAccent,Colors.redAccent),
           getdatapage('1'," ي",language?" هيا لنتعلم عن  حروف "+'\t''\t''\n'+"اللغة العربية":"Lets Go and learn about "+'\t''\t''\n'+"arabic letters",Colors.orange.shade300,Colors.greenAccent),
           
        ],
      ),);
  }
  String value;
      Container getdatapage(id,image,text,color,Color textColor)
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
            builder: (context) => GamearabMatching(
               
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
               child:Text(
                image,
                style: TextStyle(
                  color: textColor,
                  fontSize: 150,
                  fontFamily: 'CabinSketch',
                  fontWeight: FontWeight.bold)),
                
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



