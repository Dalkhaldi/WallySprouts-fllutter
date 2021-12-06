 
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallysprouts/pages/social/containt.dart';
import 'package:wallysprouts/pages/social/searchusers.dart';
import 'package:wallysprouts/pages/social/pageroute.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends  StatefulWidget {
  
   _SearchPageState createState() => _SearchPageState();
}
var cont;
class _SearchPageState extends State<Search> {
 
  
 
  Future getpost() async {
    var url = "http://192.168.1.8:8081/WallySprouts/allpost.php";
    var response = await http.get(url);
    var responcebody= json.decode(response.body);
    return responcebody;
    }


    List<dynamic> listsearch = [];
  Future getData() async {
    var url1 = "http://192.168.1.8:8081/WallySprouts/searchusersearch.php";
    var response1 = await http.get(url1);
    var responsebody1 = json.decode(response1.body);
    print("jhkjdhsghsfgfhfshjfshjfghdgfhdgfhgdhsghgdhf");
    print(responsebody1);
    for (int i = 0; i < responsebody1.length; i++) 
    {
      listsearch.add(responsebody1[i]['username']);
    }
    
    print(listsearch);
  }
   @override
  void initState() {
    getData();
    super.initState();
  }
    Widget _tagitem(String title){
  return Container(
    margin: EdgeInsets.only(left: 10,right: 10),
    child:Container(
       child: FlatButton(
         onPressed: (){
        
         Navigator.of(cont).push(MaterialPageRoute(
     builder:(context)=>Containt(title)));
      
       },
        child: Text(title ,style:TextStyle(color:Colors.grey,fontSize: 15.0, ))
        ),
    margin: EdgeInsets.all(5),
    ),
    decoration: BoxDecoration(
      border:Border.all(width:1,color:Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular((5)))
    ),
  );

}
  @override
  Widget build(BuildContext context) {
    List listimage =[ ];
   // listimage.add('');
    cont=context;
    return Scaffold(
     appBar: AppBar(
       
       elevation: 0,
       backgroundColor: Colors.white,
     title: Container(
       
      decoration:BoxDecoration( 
        border: Border.all(color:Colors.grey,
        width:2.0),
       borderRadius: BorderRadius.all(Radius.circular(20),)
       
      ),
       
       child:Container(
         height: 35,
        child: TextField(
          decoration: InputDecoration(
            
        hintText: "Search acounts",
        border: InputBorder.none,
        icon:  
        IconButton(
                    icon: Icon(
                     Icons.search,
                     color: Colors.black,
                      size: 20.0,
                    ),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: SearchData(listsearch));
                    }),
        ),
       ))
     ),
     actions:<Widget> [
        Container(
          margin: EdgeInsets.only(
            right:10,left: 0, 
          ),
        )
     ],
     ),
     body: SafeArea(
       
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
             
         
             Container(
               height:30,
              // margin: EdgeInsets.only(top:5,bottom: 5),
               child:ListView(
                 scrollDirection:Axis.horizontal,
                 
                 children:<Widget>[
                  _tagitem("Genaric"),
                   _tagitem("Health"),
                   _tagitem("Medical"),
                   _tagitem("Education"),
                   _tagitem("Play"),
                   _tagitem("Suport"),
                  _tagitem("Associations"), 
                   
                 ])
             ),
           /* listimage!=null?
               SliverStaggeredGrid.countBuilder(
              // padding: const EdgeInsets.all(8.0),
               crossAxisCount: 6,
            /* mainAxisSpacing: 1,
             crossAxisSpacing: 1,*/
             itemCount:listimage.length ,
             itemBuilder: (contix,i){
               String imagePath= listimage[i].data['image'];
               return new Material(
                 elevation: 8.0,
                 borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                 child:new InkWell(
                   onTap: (){},
                   child:new Hero(tag:"image",
                   child:new FadeInImage(
                     image:new NetworkImage("imagepath"),//set imagepath
                     fit:BoxFit.cover,
                     placeholder: AssetImage("images/placeholder.png") ,
                   ) ,)
                 )
               );
               
             },  
             /*children:List.generate((18),
              (int i)
             {
                 return _girditem(i);
             } , ),
             staggeredTiles: List.generate((18), (int index) {
               int remoin=index %18;
               if(remoin ==1 || remoin ==9)
               {
                    return StaggeredTile.count(2, 2);
               }
               return StaggeredTile.count(1, 1);
             } ),*/
             staggeredTileBuilder: (i) =>new StaggeredTile.count(2, i.isEven?2:3),
             mainAxisSpacing:8.0,
             crossAxisSpacing:8.0,

             ):new Center(child:new CircularProgressIndicator())*/
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 10,
                  ),
                 /* decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),*/
                  child: Container(
                    child: FutureBuilder(
                      future: getpost(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ?  new StaggeredGridView.countBuilder(
                               
                                 
                                      padding: const EdgeInsets.all(4.0),
                                  crossAxisCount:4 ,
                                   
                                 itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  List list = snapshot.data;
                                  return RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Routpage(
                                             "posts",
                                             list[index]['username'],
                                             list[index]['post_user'],
                                             list[index]['caption'],
                                             list[index]['image'],
                                              list[index]['is_vedio'],
                                               list[index]['post_id'],
                                               list[index]['user_image'],
                                               list[index]['post_subject'],
                                               
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'logo$index',
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image:list[index]['is_vedio']=='i'? NetworkImage(
                                              "http://192.168.1.8:8081/WallySprouts/upload/${list[index]['image']}",
                                            ):AssetImage("images/video.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                 staggeredTileBuilder: (i) =>new StaggeredTile.count(2, i.isEven?2:3),
                                  mainAxisSpacing:3.0,
                                  crossAxisSpacing:3.0,
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                )),
         
       
               ]) ),
    


     );


  }}



    
  


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
    return SearchusersPage(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = 
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
      // list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return (ListTile(
            leading: Icon(Icons.supervised_user_circle, color: Color(0xff01a3a4)),
            title: Text(searchlist[i]),
            onTap: () {
              query = searchlist[i];
              showResults(context);
            },
          ));
        });
  }
}
