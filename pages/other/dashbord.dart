import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  myItems item1 = new myItems(
      title: "Childrens Side",
      subtitle: "Lets Start !",
      img: "images/childrenside.png",
      routingTo: "childe");

  myItems item2 = new myItems(
      title: "Family Side",
      subtitle: "Lets Start !",
      img: "images/familyside.png",
      routingTo: "fammily");

  @override
  Widget build(BuildContext context) {
    List<myItems> myList = [item1, item2];
    var color = 0xff192a56;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(data.routingTo);
              },
            );
          }).toList()),
    );
  }
}

class myItems {
  String title;
  String subtitle;
  String img;
  String routingTo;
  myItems({this.title, this.subtitle, this.img, this.routingTo});
}
