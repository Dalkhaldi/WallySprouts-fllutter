import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
import 'package:wallysprouts/pages/children/childrenvedio.dart';
class CatigoryW extends StatelessWidget {
  String image;
  String text;
  Color color;

  CatigoryW({this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Color(0xff81ecec),
              Color(0xff81ecec),
              Color(0xff81ecec),
              Color(0xff01a3a4),
              Color(0xff01a3a4),
              Color(0xffa29bfe)
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 90,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(color: Color(0xFF363567), fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class Childrensection extends StatelessWidget {
  bool language = false;
  Childrensection({@required this.language});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.rotate(
                origin: Offset(30, -60),
                angle: 2,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xff01a3a4),
                        Color(0xff81ecec),
                        Color(0xff81ecec),
                        Color(0xff81ecec),
                        Color(0xff01a3a4),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, top: 330),
                child: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowLeft,
                        size: 40, color: Color(0xffa29bfe)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('choosechild');
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 380),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/sect.png',
                                  text: language ? "المكتبة" : 'Library',
                                ),
                                onTap: () { Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Childrvideo(
                                        
                                      ),
                                    ),
                                  );}
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/sorting1.png',
                                  text: language ? "الاقسام" : 'Sections',
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Categorychildrenside(
                                        language: language,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 650,
                  ),
                  height: 30,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xffa29bfe),
                        Color(0xff01a3a4),
                        Color(0xff81ecec),
                        Color(0xff81ecec),
                        Color(0xff81ecec),
                        Color(0xff01a3a4),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
