import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallysprouts/pages/other/dashbord.dart';
import 'package:wallysprouts/pages/other/drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePagestart extends StatefulWidget {
  @override
  _HomePagestart createState() => _HomePagestart();
}

class _HomePagestart extends State<HomePagestart> {
  String user;
  String email;
  String id;
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user = preferences.getString("username");
      email = preferences.getString("email");
      id = preferences.getString("id");
      print(user);
      print(email);
      print(id);
    });
  }

  @override
  void initState() {
    getpref();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff01a3a4),
        title: Center(
          child: Text(
            "Wally Sprouts",
            style: TextStyle(fontFamily: "DancingScript"),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.yellowAccent.withOpacity(0.7),
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: myDrawer(),
      body: Column(
        children: [
          Container(
            child: SizedBox(
              height: 185.0,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                dotColor: Colors.grey,
                dotIncreaseSize: 3,
                dotSize: 5,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotIncreasedColor: Colors.white,
                dotBgColor: Color(0xff01a3a4).withOpacity(0.5),
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  //children&mother
                  //graduation
                  Image.asset('assets/edu1.jpg'),
                  Image.asset('assets/edu2.jpg'),
                  Image.asset('assets/children&mother.jpg'),
                  Image.asset('assets/children&mother2.jpg'),
                  Image.asset('assets/children&mother3.jpg'),
                  // Image.asset('assets/images/kidsParty.jpg'),
                  // Image.asset('assets/images/reading.jpg'),
                  // Image.asset('assets/images/searchBg.png'),
                  // Image.asset(
                  //   'assets/images/socialMedia.jpg',
                  // ),
                  // Image.asset('assets/images/cong.jpg'),
                  // Image.asset('assets/images/graduation.jpg'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              "Sections",
              style: TextStyle(fontSize: 30, fontFamily: "DancingScript"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
