import 'dart:async';

import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
 

class Socketconec 
{
   Socket _socket;
   static const String SERVER_IP="127.0.0.1";
   static const int SERVER_PORT= 6000;
   Future<bool> sendmsg(String msg,Function connectionlistener,
   Function messagelistner)async
   {
     try{
       _socket=await Socket.connect(SERVER_IP, SERVER_PORT);
       connectionlistener(true);
       _socket.listen((List <int> event) {
         String msg= utf8.decode(event);
         print('Massage:$msg');
         messagelistner(msg);
       });
       _socket.add(utf8.encode(msg));
       _socket.close();
     }catch(e)
     {
       connectionlistener(false);
       return false;
     }
    return true;
   }
   void cleanUp()
   {
     if(null !=_socket)
     {
       _socket.destroy();
     }
   }
}