import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallysprouts/pages/children/pagchosefirst.dart';
import 'package:wallysprouts/pages/other/childsection.dart';
import 'package:wallysprouts/pages/children/pageinter.dart';

class CatigoryW extends StatelessWidget {
  String image;
  String text;
  Color color;

  CatigoryW({this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 120,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x9F3D416E),
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
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class Categorychildrenside extends StatelessWidget {
  bool language = false;
  Categorychildrenside({@required this.language});
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
                angle: 2.4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xff81ecec), Color(0xff81ecec)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 30),
                child: IconButton(
                    icon: Icon(FontAwesomeIcons.arrowLeft,
                        size: 30, color: Color(0xffa29bfe)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Childrensection(//intsectionchildren//HomePagestart
                            language: language,
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
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
                                  image: 'images/notebook.png',
                                  text: language ? "المذكرات" : 'Memo',
                                  color: Color(0xFF47B4FF),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('MyliquidSwipememo');
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/book22.png',
                                  text:
                                      language ? "كتب مؤلفة" : "Authored Books",
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed("allbookswithratefivestar");
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/painting.png',
                                  text: language ? "ابدع" : 'Create',
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamed("GameDrawpart"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/abcd.png',
                                  text: language ? "الحروف" : 'ABC',
                                  color: Color(0xFF47B4FF),
                                ),
                                 onTap: () =>    Navigator.of(context).push(MaterialPageRoute(
                                            builder:(context)=> fistsectionchildren(flage:false)))),
                              
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/numb.png',
                                  text: language ? "الارقام" : "123",
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          numbersectionchildren(
                                        flage: language,
                                      ),
                                    ),
                                  );*/
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/colorsection.png',
                                  text: language
                                      ? "قسم الالوان"
                                      : 'Colors Section',
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          colorsectionChildren(
                                        flage: language,
                                      ),
                                    ),
                                  );*/
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/animals.png',
                                  text: language
                                      ? "قسم الحيوانات"
                                      : 'Animals Section',
                                  color: Color(0xFF47B4FF),
                                ),
                                onTap: () {
                                  //
                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          animalsectionchildren(
                                        flage: language,
                                      ),
                                    ),
                                  );*/
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/intelligence.png',
                                  text: language
                                      ? "قسم الذكاء"
                                      : "intelligence Section",
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          IntelligenceGamesSection(
                                        flage: language,
                                      ),
                                    ),
                                  );*/
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/game.png',
                                  text: language
                                      ? "قسم الترفيه"
                                      : 'Entertainment section',
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => intsectionchildren(flage:false
                            
                          ),
                        ),
                      );
                    
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/rating1.png',
                                  text: language
                                      ? "تقيمات الالعاب"
                                      : 'Rate in Games',
                                  color: Color(0xFF47B4FF),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed("gameRate");
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/rating.png',
                                  text: language
                                      ? "تقيمات الاختبارات"
                                      : "Rate in Quizzes",
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          IntelligenceGamesSection(
                                        flage: language,
                                      ),
                                    ),
                                  );*/
                                },
                              ),
                              InkWell(
                                child: CatigoryW(
                                  image: 'images/top.png',
                                  text: language
                                      ? "اعلى الدرجات"
                                      : "Highest Scores",
                                  color: Color(0xFFA885FF),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed("CoverpagehighestScores");
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
            ],
          ),
        ],
      ),
    );
  }
}
