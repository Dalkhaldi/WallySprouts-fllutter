import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:wallysprouts/pages/children/adminaddvideo.dart';
import 'package:wallysprouts/pages/children/Alettergames/dragalpha.dart';
import 'package:wallysprouts/pages/children/showvideo.dart';
import 'package:wallysprouts/pages/other/childsection.dart';

class Childrvideo extends StatefulWidget {
  @override
  _ChildrvideoState createState() => _ChildrvideoState();
}

class _ChildrvideoState extends State<Childrvideo> {
  String child = " ";
  String video_id;
  bool language = false;
  String age;

  Future getvideos(type) async {
    //print("hhhhhhhhhhhhhhhhhhhhhh");
    //print(category);
    if(category == "Age 2")
    {
         age="2";
    }
    if(category == "Age 3")
    {
         age="3";
    }
    var data = {"video_type": type, "child_age":"2"};
    print (type);
    var url;
    url = "http://192.168.1.8:8081/WallySprouts/videochild.php";
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody.toString() + "kkkkk");
    return responsebody;
  }

  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      category = preferences.getString("suitableAge");
      child = preferences.getString("childID");
      language = preferences.getBool("language");
      print(child.toString());
    });
  }

  setpref11(String s1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("suitableAge", s1);
    });
  }

   

  void initState() {
   // getpref();
    print(category);
    super.initState();
  }

  String category = "Age 2";
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  Widget imageandtitle(String imageVal, String txtVal) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 50,
        ),
        Container(
          height: 55.0,
          width: 80.0,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.grey),
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          txtVal,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget categorytype() {
    return Container(
        height: 120.0,
         margin:EdgeInsets.only( left: 95),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 20),
            Column(children: [
              Container(
                height: 75,
                width: 80,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff01a3a4).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(33)),
                    child: Image.asset(
                      "assets/images/childrensidebook.png",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('childrenbook');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(child: Text(language ? "الكتب" : "Books"))
            ]),
            SizedBox(
              width: 20,
            ),
            Column(children: [
              Container(
                height: 75,
                width: 80,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                       color: Color(0xffd35400).withOpacity(0.2), 
                        borderRadius: BorderRadius.circular(33)),
                    child: Image.asset(
                      "assets/images/bock.gif",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('video');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(child: Text(language ? "الفيديو" : "Videos"))
            ]),
            SizedBox(
              width: 20,
            ),
             
            
           
            SizedBox(
              width: 20,
            ),
            
              
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: AssetImage('assets/images/app.png'))),
            // ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff01a3a4),
                      ),
                      onPressed: () {
                        
                         Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Childrensection(language: language,);
                               }));
                      }),
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                      child: Text(
                    language ? "المكتبة" : "Library",
                    style: TextStyle(fontSize: 40, color: Color(0xff01a3a4)),
                  )),
                ])),
            categorytype(),

            Center(
              child: DropdownButton<String>(
                onTap: () {},
                value: category,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Color(0xff01a3a4),
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff01a3a4),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    category = newValue;
                  
                    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                    print(category);
                    setpref11(category);

                   // Navigator.of(context).pushNamed("video");
                   Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return Childrvideo();
                               }));
                  });
                },
                items: <String>[
                  'Age 2',
                  'Age 3',
                  'Age 4-5',
                  'Age 6',
                   
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Container(
                    child: Text(
                  language ? "أغاني سوبر سمبل" : "Super Simple Songs",
                 
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ))),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              child: FutureBuilder(
                future: getvideos("Super Simple Songs"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  video_id=list[index]['video_id'];
                                });
                                
                                     
                                Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return VideoApp(video_id);
                               }));
                              },
                              child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "http://192.168.1.8:8081/WallySprouts/childvideo/${list[index]['video_image']}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(child: Text(list[index]['video_name']))
                              ]),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),

            Divider(thickness: 3),
            Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Container(
                    child: Text(
                   
                 language ?"قصص فيني وكيكي": "Finny & keke stories",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ))),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 220,
              child: FutureBuilder(
                future: getvideos("Finny & keke stores"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  video_id=list[index]['video_id'];
                                });
                                
                                     
                                Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return VideoApp(video_id);
                               }));
                              },
                              child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "http://192.168.1.8:8081/WallySprouts/childvideo/${list[index]['video_image']}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(child: Text(list[index]['video_name']))
                              ]),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),

            Divider(thickness: 3),
            Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Container(
                    child: Text(
                   
                 language ?  "الحروف A|أ": "Alphabit A|أ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ))),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              child: FutureBuilder(
                future: getvideos("Alphabit A|أ"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return InkWell(
                              onTap: () {
                               setState(() {
                                  video_id=list[index]['video_id'];
                                });
                                
                                     
                                Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return VideoApp(video_id);
                               }));
                              },
                              child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "http://192.168.1.8:8081/WallySprouts/childvideo/${list[index]['video_image']}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(child: Text(list[index]['video_name']))
                              ]),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
              Divider(thickness: 3),
            Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Container(
                    child: Text(
                   
                 language ?  " الأرقام 1|ا  ": "Numbers 1|ا",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ))),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: FutureBuilder(
                future: getvideos("Numbers 1|ا"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return InkWell(
                              onTap: () {
                               setState(() {
                                  video_id=list[index]['video_id'];
                                });
                                
                                     
                                Navigator.of(context).push(MaterialPageRoute(
                               builder: (context){
                                   return VideoApp(video_id);
                               }));
                              },
                              child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "http://192.168.1.8:8081/WallySprouts/childvideo/${list[index]['video_image']}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(child: Text(list[index]['video_name']))
                              ]),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
