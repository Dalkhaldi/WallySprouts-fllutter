/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:getflutter/components/rating/gf_rating.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
//import 'Read.dart';
 

//Rating
class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool s = true;
  String user = " ";
  String email = " ";
  String id = " ";

  String friendname = " ";
  String friendemail = " ";
  String friendpic = " ";

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

  Future _Alert(BuildContext context, String temp) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(temp),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<dynamic> listsearch1 = [];
  Future viewAllFollowers() async {
    var data = {"id": id};
    var url = "http://192.168.2.106/GProject/viewAllFollowers.php";
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch1.add(responsebody[i]['followersname']);
    }
    return responsebody;
  }

  Future _delete_Followers(String follower_id) async {
    final uri = Uri.parse("http://192.168.2.106/GProject/delete_Follower.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['follower_id'] = follower_id;

    var response = await request.send();
    if (await response.statusCode == 200) {
      print('Follower Deleted');
    } else {
      print('Follower Not Deleted');
    }
  }

  Center all_followers(String user_id, String user_name, String category,
      String user_pic, String friend_id, bool hide_or_show, String delete) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Color(0xff01a3a4),
                ),
              ],
              color: Colors.white),
          child: Center(
            child: ListTile(
              title: Text(
                user_name,
                softWrap: true,
              ),
              leading: CircleAvatar(
                backgroundColor: Color(0xff01a3a4),
                child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "http://192.168.2.106/GProject/uploads/${user_pic}")))),
              ),
              subtitle: Row(children: [
                RaisedButton(
                    color: Color(0xff192a56),
                    child: Text(
                      delete,
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      setState(() {
                        _delete_Followers(user_id);
                      });
                    }),
              ]),
            ),

            //
          )),
    );
  }

  @override
  void initState() {
    getpref();
    viewAllFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(0xffdfe6e9),
        child: Column(
          children: <Widget>[
            _myAppBar3(),
            Container(
              child: Text(
                "Followers",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff01a3a4),
                    fontFamily: "DancingScript"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white30,
                child: Container(
                  child: FutureBuilder(
                    future: viewAllFollowers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List list = snapshot.data;
                                return Column(children: [
                                  all_followers(
                                      list[index]['followers_id'],
                                      list[index]['followersname'],
                                      list[index]['category'],
                                      list[index]['followerspic'],
                                      "",
                                      true,
                                      "Delete Follower"),
                                  SizedBox(
                                    height: 10,
                                  )
                                ]);
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myAppBar3() {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Color(0xff01a3a4),
            Color(0xff192a56),
          ],
          begin: Alignment.centerRight,
          end: new Alignment(-1.0, -1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('Home');
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'Follow Friends',
                  style: TextStyle(
                      fontFamily: "DancingScript",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: SearchData(listsearch1));
                    }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount += _favoriteCount;
        _isFavorited = false;
      } else {
        _favoriteCount -= _favoriteCount;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: Color(0xffed1e79),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 35,
          child: Container(
            child: Text(
              '$_favoriteCount',
              style: TextStyle(color: new Color(0xff662d8c), fontSize: 18.0),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchData extends SearchDelegate<String> {
  List<dynamic> list;
  SearchData(this.list);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear),
          color: Color(0xff01a3a4))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
        color: Color(0xff01a3a4));
  }

  // }
  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return (ListTile(
            leading:
                Icon(Icons.supervised_user_circle, color: Color(0xff01a3a4)),
            title: Text(searchlist[i]),
            onTap: () {
              query = searchlist[i];
              showResults(context);
            },
          ));
        });
  }
}
*/