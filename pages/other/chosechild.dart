import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:wallysprouts/pages/other/childsection.dart';

//import 'Childrensection.dart';

class choosechild extends StatefulWidget {
  @override
  _choosechildState createState() => _choosechildState();
}

class _choosechildState extends State<choosechild> {
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  String user = " ";
  String email = " ";
  String id;
  bool language = false;
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      language = preferences.getBool("language");
      user = preferences.getString("username");
      email = preferences.getString("email");
      id = preferences.getString("id");
      language = preferences.getBool("language");
      if (language == null) {
        language = false;
      }
      print(user);
      print(email);
      print(id);
    });
  }

  void initState() {
    getpref();
    listofchildren('2',"jack",'',"3");
    super.initState();
  }

  Future viewChildren() async {
    var url = "http://192.168.2.108:8010/GProject/viewChildren.php";
    var data = {"parentId": id};
    var response = await http.post(url, body: data);
    return json.decode(response.body);
  }

  setpref10(String childid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("childID", childid);
    });
  }

  listofchildren(
      String childrens_id, String childName, String image, String childAge) {
        print("iammmmm in");
    return InkWell(
      child: Column(children: [
        SizedBox(height: 20),
        new Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
                border: Border.all(color: Color(0xff192a56), width: 5),
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image:new NetworkImage('https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')/*new NetworkImage(
                        "http://192.168.2.108:8010/GProject/uploads/${image}")*/))),
        SizedBox(
          height: 20,
        ),
        Text("jack",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black)),
        SizedBox(
          width: 120,
        )
      ]),
      onTap: () {
        setpref10(childrens_id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Childrensection(
              language: language,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff01a3a4).withOpacity(0.9),
      appBar: AppBar(
          elevation: 100,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('Welcomechilde');
              }),
          backgroundColor: Color(0xff01a3a4),
          title: Text(language ? "اختار الطفل" : "Choose Child",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'DancingScript',
                  fontSize: 30.0))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        glowColor: Color(0xff192a56),
        endRadius: 100.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            //Navigator.of(context).pushNamed('addchild');
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Childrensection(
              language: language,
            ),
          ),
        );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Color(0xff01a3a4),
              Color(0xff01a3a4),
              Colors.white,
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xFF363567),
              Color(0xffa29bfe),
              Color(0xffa29bfe),
              Color(0xffa29bfe),
            ],
            begin: Alignment.centerRight,
            end: new Alignment(-1.0, -1.0),
          ),
        ),
       /* child: FutureBuilder(
          future: viewChildren(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ListView(
                    padding: EdgeInsets.only(left: 100, top: 200),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                        for (int index = 0;
                            index < snapshot.data.length;
                            index++)
                          listofchildren(
                              snapshot.data[index]['child_id'],
                              snapshot.data[index]['childName'],
                              snapshot.data[index]['image'],
                              snapshot.data[index]['childAge']),
                        SizedBox(width: 150),
                      ])
                : Center(child: Text(" "));
          },
        ),*/
      ),
    );
  }
}
