import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//Backend $$$$$$$$$$$$$$$$$$$$$$$$$$$$
class myDrawer extends StatefulWidget {
  @override
  _myDrawer createState() => _myDrawer();
}

class _myDrawer extends State<myDrawer> {
  String user = " ";
  String email = " ";
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

  /*Future viewChildren() async {
    var url = "http://192.168.2.106/GProject/viewChildren.php";
    var data = {"parentId": id};
    var response = await http.post(url, body: data);
    print(response.body);
    return json.decode(response.body);
  }

  Future _delete_child(String child_id) async {
    final uri = Uri.parse("http://192.168.2.106/GProject/delete_child.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['child_id'] = child_id;

    var response = await request.send();
    if (await response.statusCode == 200) {
      print('Done');
    } else {
      print('Error');
    }
  }*/

  setpref10(String childid, String s1, String s2) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("childiddd", childid);
      preferences.setString("childName", s1);
      preferences.setString("childAge", s2);
    });
  }

  //   setpref(
  //     String s1, String s2) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     preferences.setString("childName", s1);
  //     preferences.setString("childAge", s2);
  //   });
  // }

  @override
  void initState() {
    getpref();
    super.initState();
  }

  listofchildren(
      String childrens_id, String childName, String image, String childAge) {
    return ListTile(
        title: Text(childName,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Color(0xff01a3a4))),
        subtitle: Padding(
          padding: EdgeInsets.only(left: 130),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text("Edit Profile"),
              onTap: () {
                setpref10(childrens_id, childName, childAge);
                Navigator.of(context).pushNamed('updateChildinfo');
              },
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text("Delete Child"),
              onTap: () {
                //_delete_child(childrens_id);
                Navigator.of(context).pushNamed('Home');
              },
            )
          ]),
        ),
        leading: new Container(
            width: 50.0,
            height: 120.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "http://192.168.2.106/GProject/uploads/${image}")))),
        dense: true, //بصغر الخط
        contentPadding: EdgeInsets.all(10),
        onTap: () async {
          Navigator.of(context).pushNamed('myDrawer');
          Navigator.of(context).pushNamed('childprofile');
        });
  }

  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text(email),
          accountName: Text(user),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xff01a3a4))),
          decoration: BoxDecoration(
            color: Color(0xff01a3a4),
          ),
        ),
        ListTile(
          title: Text("Children's",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Color(0xff01a3a4))),
          dense: true, //
        ),
        FutureBuilder(
         // future: viewChildren(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            // List list = snapshot.data,
            return snapshot.hasData
                ? new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        for (int index = 0;
                            index < snapshot.data.length;
                            index++)
                          listofchildren(
                              snapshot.data[index]['child_id'],
                              snapshot.data[index]['childName'],
                              snapshot.data[index]['image'],
                              snapshot.data[index]['childAge'])
                      ])
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        Divider(
          color: Color(0xff01a3a4),
          height: 80,
        ),
        ListTile(
            title: Text("My Events",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Color(0xff01a3a4))),
            leading: Icon(Icons.event, color: Color(0xff01a3a4)),
            dense: true, //بصغر الخط
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).pushNamed('myevent');
            }),
        ListTile(
            title: Text("Add Child",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Color(0xff01a3a4))),
            leading: Icon(Icons.add_circle, color: Color(0xff01a3a4)),
            dense: true, //بصغر الخط
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).pushNamed('addchild');
            }),
        ListTile(
            title: Text("Followers",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Color(0xff01a3a4))),
            leading: Icon(Icons.people, color: Color(0xff01a3a4)),
            dense: true, //بصغر الخط
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).pushNamed('Followers');
            }),
        ListTile(
            title: Text("Followed",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Color(0xff01a3a4))),
            leading: Icon(Icons.visibility, color: Color(0xff01a3a4)),
            dense: true, //بصغر الخط
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).pushNamed('Followed');
            }),
        ListTile(
            title: Text("Follow Friends",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Color(0xff01a3a4))),
            leading: Icon(Icons.add_circle, color: Color(0xff01a3a4)),
            dense: true, //بصغر الخط
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).pushNamed('followFriends');
            }),
        Divider(
          color: Color(0xff01a3a4),
          height: 50,
        ),
        ListTile(
          title: Text("Setting",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Color(0xff01a3a4))),
          leading: Icon(Icons.settings, color: Color(0xff01a3a4)),
          dense: true, //بصغر الخط
          contentPadding: EdgeInsets.all(10),
          onLongPress: () => print("LongPress"),
          onTap: () => print("shortPress"),
        ),
        ListTile(
          title: Text("About App",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Color(0xff01a3a4))),
          leading: Icon(
            Icons.info,
            color: Color(0xff01a3a4),
          ),

          dense: true, //بصغر الخط
          contentPadding: EdgeInsets.all(10),
          onLongPress: () => print("LongPress"),
          onTap: () => print("shortPress"),
        ),
        ListTile(
          title: Text("Log Out",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Color(0xff01a3a4))),
          leading: Icon(Icons.arrow_back, color: Color(0xff01a3a4)),
          dense: true, //بصغر الخط
          contentPadding: EdgeInsets.all(10),
          onLongPress: () => print("LongPress"),
          onTap: () => Navigator.of(context).pushNamed('login'),
        )
      ],
    ));
  }
}
