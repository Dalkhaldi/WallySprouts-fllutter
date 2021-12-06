import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { Hard, Medium, Easy }
class Itemdata {
  final String name;
  final String address;
  final String voice;
  Itemdata({this.name, this.address,this.voice});
}
List<Itemdata> fillSourceArray() {
  return [
   Itemdata(address:'assets/Letter-A-icon.png',name:'1',voice:"kid-a.mp3"),
   Itemdata(address:'assets/A2-icon.png',name:'1',voice:"kid-a.mp3"),
   Itemdata(address:'assets/Letter-B-icon.png',name:'2',voice:"kid-b.mp3"),
   Itemdata(address:'assets/B2-icon.png',name:'2',voice:"kid-b.mp3"),
    Itemdata(address:'assets/Letter-C-icon.png',name:'3',voice:"kid-c.mp3"),
    Itemdata(address:'assets/C2-icon.png',name:'3',voice:"kid-c.mp3"),
    Itemdata(address:'assets/Letter-D-icon.png',name:'4',voice:"kid-d.mp3"),
    Itemdata(address:'assets/D2-icon.png',name:'4',voice:"kid-d.mp3"),
    Itemdata(address:'assets/Letter-E-icon.png',name:'5',voice:"kid-e.mp3"),
    Itemdata(address:'assets/E2-icon.png',name:'5',voice:"kid-e.mp3"),
    Itemdata(address:'assets/Letter-F-icon.png',name:'6',voice:"kid-f.mp3"),
    Itemdata(address:'assets/F2-icon.png',name:'6',voice:"kid-f.mp3"),
    Itemdata(address:'assets/Letter-J-icon.png',name:'7',voice:"kid-j.mp3"),
    Itemdata(address:'assets/J2-icon.png',name:'7',voice:"kid-j.mp3"),
    Itemdata(address:'assets/Letter-H-icon.png',name:'8',voice:"kid-h.mp3"),
    Itemdata(address:'assets/H2-icon.png',name:'8',voice:"kid-h.mp3"),
    Itemdata(address:'assets/Letter-I-icon.png',name:'9',voice:"kid-i.mp3"),
    Itemdata(address:'assets/I2-icon.png',name:'9',voice:"kid-i.mp3"),
    //Itemdata(address:'assets/Letter-G-icon.png',name:'10'),
   // Itemdata(address:'assets/G2-icon.png',name:'10'),
   // Itemdata(address:'assets/Letter-K-icon.png',name:'11'),
   // Itemdata(address:'assets/K2-icon.png',name:'11'),
    //Itemdata(address:'assets/Letter-L-icon.png',name:'12'),
    //Itemdata(address:'assets/L2-icon.png',name:'6'),
    //Itemdata(address:'assets/Letter-M-icon.png',name:'13'),
    //Itemdata(address:'assets/Letter-N-icon.png',name:'14'),
    //Itemdata(address:'assets/Letter-O-icon.png',name:'15'),
   // Itemdata(address:'assets/Letter-P-icon.png',name:'16'),
   // Itemdata(address:'assets/Letter-Q-icon.png',name:'17'),
   // Itemdata(address:'assets/Letter-R-icon.png',name:'18'),
   // Itemdata(address:'assets/Letter-S-icon.png',name:'19'),
    
  ];
}
List<Itemdata> fillSourceArray2() {
  return [
    Itemdata(address:'assets/Letter-A-icon.png',name:'1',voice:"a.mp3"),
   Itemdata(address:'assets/apple-red-icon.png',name:'1',voice:"a.mp3"),
   Itemdata(address:'assets/Letter-B-icon.png',name:'2',voice:"bso.mp3"),
   Itemdata(address:'assets/Baseball-icon.png',name:'2',voice:" bso.mp3"),
    Itemdata(address:'assets/Letter-C-icon.png',name:'3',voice:"c.mp3"),
    Itemdata(address:'assets/clock-icon.png',name:'3',voice:"c.mp3"),
    Itemdata(address:'assets/Letter-D-icon.png',name:'4',voice:"d.mp3"),
    Itemdata(address:'assets/Donkey-icon.png',name:'4',voice:"d.mp3"),
    Itemdata(address:'assets/Letter-E-icon.png',name:'5',voice:"e.mp3"),
    Itemdata(address:'assets/22246-elephant-icon.png',name:'5',voice:"e.mp3"),
    Itemdata(address:'assets/Letter-K-icon.png',name:'6',voice:"k.mp3"),
    Itemdata(address:'assets/Kangaroo-icon.png',name:'6',voice:"k.mp3"),
    Itemdata(address:'assets/Letter-M-icon.png',name:'7',voice:"m.mp3"),
    Itemdata(address:'assets/22212-monkey-icon.png',name:'7',voice:"m.mp3"),
    Itemdata(address:'assets/Letter-R-icon.png',name:'8',voice:"r.mp3"),
    Itemdata(address:'assets/rabbit-icon.png',name:'8',voice:"r.mp3"),
    Itemdata(address:'assets/Letter-T-icon.png',name:'9',voice:"t.mp3"),
    Itemdata(address:'assets/iPhone-Black-W2-icon.png',name:'9',voice:"t.mp3"),
    //Itemdata(address:'assets/Letter-G-icon.png',name:'10'),
   // Itemdata(address:'assets/G2-icon.png',name:'10'),
   // Itemdata(address:'assets/Letter-K-icon.png',name:'11'),
   // Itemdata(address:'assets/K2-icon.png',name:'11'),
    //Itemdata(address:'assets/Letter-L-icon.png',name:'12'),
    //Itemdata(address:'assets/L2-icon.png',name:'6'),
    //Itemdata(address:'assets/Letter-M-icon.png',name:'13'),
    //Itemdata(address:'assets/Letter-N-icon.png',name:'14'),
    //Itemdata(address:'assets/Letter-O-icon.png',name:'15'),
   // Itemdata(address:'assets/Letter-P-icon.png',name:'16'),
   // Itemdata(address:'assets/Letter-Q-icon.png',name:'17'),
   // Itemdata(address:'assets/Letter-R-icon.png',name:'18'),
   // Itemdata(address:'assets/Letter-S-icon.png',name:'19'),
    
  ];
}
List<Itemdata> fillSourceArray3() {
  return [
   Itemdata(address:'assets/Letter-A-icon.png',name:'1',voice:"kid-a.mp3"),
   Itemdata(address:'assets/ap1.PNG',name:'1',voice:"kid-a.mp3"),
   Itemdata(address:'assets/Letter-B-icon.png',name:'2',voice:"kid-b.mp3"),
   Itemdata(address:'assets/bp1.PNG',name:'2',voice:"kid-b.mp3"),
    Itemdata(address:'assets/Letter-C-icon.png',name:'3',voice:"kid-c.mp3"),
    Itemdata(address:'assets/cp1.PNG',name:'3',voice:"kid-c.mp3"),
    Itemdata(address:'assets/Letter-D-icon.png',name:'4',voice:"kid-d.mp3"),
    Itemdata(address:'assets/D2-icon.png',name:'4',voice:"kid-d.mp3"),
    Itemdata(address:'assets/Letter-E-icon.png',name:'5',voice:"kid-e.mp3"),
    Itemdata(address:'assets/ep1.PNG',name:'5',voice:"kid-e.mp3"),
    Itemdata(address:'assets/Letter-F-icon.png',name:'6',voice:"kid-f.mp3"),
    Itemdata(address:'assets/F2-icon.png',name:'6',voice:"kid-f.mp3"),
    Itemdata(address:'assets/Letter-J-icon.png',name:'7',voice:"kid-j.mp3"),
    Itemdata(address:'assets/jp1.PNG',name:'7',voice:"kid-j.mp3"),
    Itemdata(address:'assets/Letter-O-icon.png',name:'8',voice:"kid-o.mp3"),
    Itemdata(address:'assets/op1.PNG',name:'8',voice:"kid-o.mp3"),
    Itemdata(address:'assets/Letter-I-icon.png',name:'9',voice:"kid-i.mp3"),
    Itemdata(address:'assets/I2-icon.png',name:'9',voice:"kid-i.mp3"),
    //Itemdata(address:'assets/Letter-G-icon.png',name:'10'),
   // Itemdata(address:'assets/G2-icon.png',name:'10'),
   // Itemdata(address:'assets/Letter-K-icon.png',name:'11'),
   // Itemdata(address:'assets/K2-icon.png',name:'11'),
    //Itemdata(address:'assets/Letter-L-icon.png',name:'12'),
    //Itemdata(address:'assets/L2-icon.png',name:'6'),
    //Itemdata(address:'assets/Letter-M-icon.png',name:'13'),
    //Itemdata(address:'assets/Letter-N-icon.png',name:'14'),
    //Itemdata(address:'assets/Letter-O-icon.png',name:'15'),
   // Itemdata(address:'assets/Letter-P-icon.png',name:'16'),
   // Itemdata(address:'assets/Letter-Q-icon.png',name:'17'),
   // Itemdata(address:'assets/Letter-R-icon.png',name:'18'),
   // Itemdata(address:'assets/Letter-S-icon.png',name:'19'),
    
  ];
}
List getSourceArray(
  Level level,
) {
  List<Itemdata> levelAndKindList = new List<Itemdata>();
  List sourceArray1 = fillSourceArray();
  List sourceArray2 = fillSourceArray2();
  List sourceArray3 = fillSourceArray3();
  if (level == Level.Hard) {
    sourceArray2.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    sourceArray3.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Easy) {
    sourceArray1.forEach((element) {
      levelAndKindList.add(element);
    });
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = new List<bool>();
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      new List<GlobalKey<FlipCardState>>();
  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
