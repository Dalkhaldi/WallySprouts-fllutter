 
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
import 'package:wallysprouts/pages/children/pagechoice.dart';
import 'package:wallysprouts/pages/children/cardleter.dart';
import 'package:wallysprouts/pages/children/letters.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
import 'package:wallysprouts/pages/children/pagechoice2.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
import 'package:wallysprouts/pages/children/pagecoicearabic.dart';

class  fistsectionchildren extends StatelessWidget {
  bool flage = false;

   fistsectionchildren({@required this.flage});
  final List<Widget> _categories = [
    CategoryCard(
      title: ' English letters',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: abcdsectionchildren(flage: false,), //Dragabc(),
    ),
    CategoryCard(
      title: 'Arebic letters',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: abcdarabsectionchildren(flage: false,),
    ),
     
  ];

  final List<Widget> _categoriesAR = [
    CategoryCard(
      title: 'حروف الإنجليزية',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: Dragabc(),
    ),
    CategoryCard(
      title: ' حروف العربية ',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: Dragabc(),
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
                      builder: (context) => Categorychildrenside(
                        language: flage,
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
