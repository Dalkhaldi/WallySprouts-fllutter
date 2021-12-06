import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/flipcardgame/filipcardgame.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';
 
import 'datacard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage("assets/back5.png"),
             fit:BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => _list[index].goto,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: _list[index].primarycolor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black45,
                                  spreadRadius: 0.5,
                                  offset: Offset(3, 4))
                            ]),
                      ),
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: _list[index].secomdarycolor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black12,
                                  spreadRadius: 0.3,
                                  offset: Offset(
                                    5,
                                    3,
                                  ))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              _list[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                      offset: Offset(1, 2),
                                    ),
                                    Shadow(
                                        color: Colors.green,
                                        blurRadius: 2,
                                        offset: Offset(0.5, 2))
                                  ]),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: genratestar(_list[index].noOfstar),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return abcdsectionchildren(flage:false);
                               }));
            
            setState(() {
               
            });
          },
          backgroundColor:Color(0xff01a3a4),  
          child: Icon(
            
             Icons.close
          ),
        ),
    );
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Details(
      {this.name,
      this.primarycolor,
      this.secomdarycolor,
      this.noOfstar,
      this.goto});
}

List<Details> _list = [
  Details(
      name: "EASY",
      primarycolor: Colors.green,
      secomdarycolor: Colors.green[300],
      noOfstar: 1,
      goto: FlipCardGane(Level.Easy)),
  Details(
      name: "MEDIUM",
      primarycolor: Colors.orange,
      secomdarycolor: Colors.orange[300],
      noOfstar: 2,
      goto: FlipCardGane(Level.Medium)),
  Details(
      name: "HARD",
      primarycolor: Colors.red,
      secomdarycolor: Colors.red[300],
      noOfstar: 3,
      goto: FlipCardGane(Level.Hard))
];
