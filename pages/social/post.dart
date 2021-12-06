import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Post {
    String post_id;
   String post_user;
   String userImage;
   String username;
   String image;
   String caption;
  Icon ic =Icon(FontAwesome.heart_o,) ;
  Icon heart=Icon(FontAwesome.heart_o,color:Colors.white);
  Post({
    this.post_id,
    this.post_user,
    this.userImage,
    this.username,
    this.image,
    this.caption,
     
  });
  //Map.removeWhere((key, value) => toRemove.contains(key));
  Post.fromsnapshot(Map<String,dynamic>snap){
     post_user =snap['post_id'];
     post_user =snap['post_user'];
    userImage =snap['userimage'];
    username =snap['username'];
    image =snap['image'];
    caption  =snap['caption'];

  }
   void  seticon(Icon i)
  {
    ic=i;
  }
  Icon geticon()
  {
    return ic;
  }
void seticonheart(Icon i)
{
   heart=i;

}
Icon geticonheart()
  {
    return heart;
  }
  String getpostid()
  {
    return post_id;
  }
}