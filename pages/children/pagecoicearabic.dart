 
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
import 'package:wallysprouts/pages/children/pagechoice.dart';
import 'package:wallysprouts/pages/children/cardlettersarabic.dart';
import 'package:wallysprouts/pages/children/lettersarabic.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
import 'package:wallysprouts/pages/children/pagchosefirst.dart';
 import 'package:wallysprouts/pages/children/Alettergames/bigenA.dart';

class  abcdarabsectionchildren extends StatelessWidget {
  bool flage = false;

   abcdarabsectionchildren({@required this.flage});
  final List<Widget> _categories = [
    CategoryCard(
      title:  'Letters',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen:LetterarabicScreen(), //Dragabc(),
    ),
    CategoryCard(
      title: 'Learn Words',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen:LettersarabPage(),
    ), 
    CategoryCard(
      title: 'Learn write',
      primaryColor: Color(0xff01a3a4),
      secondaryColor: Color(0xff01a3a4),
      screen: CanvasPaintingarab()
         
    ),
  ];

  final List<Widget> _categoriesAR = [
    CategoryCard(
      title: 'الحروف',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: LetterarabicScreen(),
    ),
    CategoryCard(
      title: ' تعلم الكلمات',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen:LettersarabPage(),
    ),
    CategoryCard(
      title: 'ِ تعلم الكتابة',
      primaryColor: Color(0xff01a3a4),
      secondaryColor: Color(0xff01a3a4),
      screen: Dragabc()
        
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: DecorationImage(
            image: AssetImage('images/bg-bottom(1).png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => fistsectionchildren(
                        flage:false
                      ),
                    ),
                  );
                },
              ),
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'images/topImage1(1).png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildListDelegate(flage ? _categoriesAR : _categories),
            ),
          ],
        ),
      ),
    );
  }
}
