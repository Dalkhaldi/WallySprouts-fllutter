import 'package:flutter/material.dart';

import 'package:wallysprouts/pages/other/dashfammily.dart';
import 'package:wallysprouts/pages/other/drawer.dart';

import 'package:flutter/material.dart';

class familyside extends StatefulWidget {
  @override
  _familyside createState() => _familyside();
}

class _familyside extends State<familyside> {
  @override
  void initState() {
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
        //  backgroundColor: Colors.transparent,
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
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 30, fontFamily: "DancingScript"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridDashboardfamilyside()
        ],
      ),
    );
  }
}
