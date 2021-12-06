import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboardfamilyside extends StatelessWidget {
  myItems item1 = new myItems(
      title: "Events",
      subtitle: "",
      img: "assets/event.png",
      routingTo: "eventcover");
  myItems item2 = new myItems(
      title: "Locations",
      subtitle: "",
      img: "assets/map.png",
      routingTo: "location1");
  myItems item3 = new myItems(
      title: "Highest Marks",
      subtitle: "",
      img: "assets/highestmark.png",
      routingTo: "HighestMarks");
  myItems item4 = new myItems(
      title: "Social Media",
      subtitle: "",
      img: "assets/socialmedia.png",
      routingTo: "social_home");
  myItems item5 = new myItems(
      title: "Gallery",
      subtitle: "",
      img: "assets/gallery.png",
      routingTo: "gallery");
  myItems item6 = new myItems(
      title: "Camera",
      subtitle: "",
      img: "assets/camera.png",
      routingTo: "camera");
  myItems item7 = new myItems(
      title: "Library",
      subtitle: "",
      img: "assets/books.png",
      routingTo: "bookscover");

  @override
  Widget build(BuildContext context) {
    List<myItems> myList = [item1, item2, item4, item7, item5, item6, item3];
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
