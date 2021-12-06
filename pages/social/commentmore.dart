import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Com {
  String com_id;
   String comment;
   String username;
   String comuser;
   String com_post;
  bool textflag = false; 
   
  Com({
    this.com_id,
    this.comment,
    this.username,
    this.comuser,
    this.com_post,
     
     
  });
  //Map.removeWhere((key, value) => toRemove.contains(key));
  Com.fromsnapshot(Map<String,dynamic>snap){
     //com_id =snap['com_id'];
     username =snap['username'];
      comment =snap['comment'];
    comuser =snap['comuser'];
    com_post =snap['com_post'];
     

  }
   void  setmoref(text)
  {
     
    
    textflag=!text;
  }
  bool getmoref()
  {
   return textflag;
  }
void seticmid(id)
{
   com_id=id;

}
String getcid()
  {
    return com_id;
  }
}