import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallysprouts/pages/children/games/trisGame/main_tetris.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String page;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget screen;

  CategoryCard({
    Key key,
    @required this.title,
     @required this.page,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.screen,
  }) : super(key: key);

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: Colors.grey[900].withOpacity(0.2),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      height: 90.0,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            if(page=="3")
           { ChangeNotifierProvider(
        create: (context) => Data(),
        child:  screen,
      );}
           else _navigate(context, screen);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
            ),
            child: Text(title, style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 25.0))
          ),
        ),
      ),
    );
  }
}
