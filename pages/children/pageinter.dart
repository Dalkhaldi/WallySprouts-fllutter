 
import 'package:flutter/material.dart';
import 'package:wallysprouts/pages/children/Alettergames/lettera.dart';
import 'package:wallysprouts/pages/children/pagechint.dart';
import 'package:wallysprouts/pages/children/cardleter.dart';
import 'package:wallysprouts/pages/children/letters.dart';
import 'package:wallysprouts/pages/children/pagchosefirst.dart';
import 'package:wallysprouts/pages/children/flipcardgame/homecard.dart';
import 'package:wallysprouts/pages/children/Alettergames/drawA1.dart';
import 'package:wallysprouts/pages/children/games/jumbBox/box_main.dart';
import 'package:wallysprouts/pages/children/games/tic_tac_toe/main_tic.dart';
import 'package:wallysprouts/pages/children/games/trisGame/main_tetris.dart';
import 'package:wallysprouts/pages/children/games/snake.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
import 'package:wallysprouts/pages/other/categorychildside.dart';
class  intsectionchildren extends StatelessWidget {
  bool flage = false;

   intsectionchildren({@required this.flage});
  final List<Widget> _categories = [
    CategoryCard(
      page: "1",
      title: 'JumpBox',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen:GameMain(), //Dragabc(),
    ),
    CategoryCard(
      page: "2",
      title: 'TicTacToe',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: Tictactoe(),
    ),
    CategoryCard(
      page: "3",
      title: 'Tetris',
      primaryColor: Color(0xff01a3a4),
      secondaryColor: Color(0xff01a3a4),
      screen: TetrisGame()
         
    ),
    CategoryCard(
      page: "4",
      title: 'Snake',
      primaryColor: Colors.yellowAccent[400],
      secondaryColor: Colors.yellowAccent[700],
      screen: MyAppsnacke()  
    ),
  ];

  final List<Widget> _categoriesAR = [
    CategoryCard(
      page: "4",
      title: ' الصندوق القافز',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: GameMain(),
    ),
    CategoryCard(
      page: "4",
      title: ' XO',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: Tictactoe(),
    ),
    CategoryCard(
      page: "3",
      title: 'المكعبات ',
      primaryColor: Color(0xff01a3a4),
      secondaryColor: Color(0xff01a3a4),
      screen: HomePage(),
        
    ),
     CategoryCard(
       page: "4",
      title: ' الأفعى ',
      primaryColor: Color(0xff01a3a4),
      secondaryColor: Color(0xff01a3a4),
      screen: MyAppsnacke(),
        
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
