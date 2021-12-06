import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
 
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

final videoname = TextEditingController();
final section = TextEditingController();
 

class Addvideochild extends StatefulWidget {
  @override
  _AddvideochildState createState() => _AddvideochildState();
}

class _AddvideochildState extends State<Addvideochild> {
  Future _Alert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('The Book has been Posted'),
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

  @override
  File _image;
  File _file;
  final picker = ImagePicker();
  final filepicker = FilePicker;
String category = "Age 2";
  Future choiceFile() async {
    _file = await FilePicker.getFile();
  }

  Future choiceImagefromGallery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future uploadbook() async {
    final uri = Uri.parse("http://192.168.1.8:8081/WallySprouts/addvideochild.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['video_name'] = videoname.text;
    request.fields['video_type'] = section.text;
    request.fields['child_age'] = category;
     
    var fil = await http.MultipartFile.fromPath("video_path", _file.path);
    var pic = await http.MultipartFile.fromPath("video_image", _image.path);
    request.files.add(pic);
    request.files.add(fil);
    var response = await request.send();

    if (response.statusCode == 200) {
      _Alert(context);
      print('video Uploded');
    } else {
      print('video Not Uploded');
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundEvent(),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 320),
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff192a56),
                        ),
                        onPressed: () {
                           
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35, top: 30),
                  child: Column(children: <Widget>[
                    TextField(
                      controller: videoname,
                      decoration: InputDecoration(labelText: 'Video Name'),
                    ),
                    TextField(
                      controller: section,
                      decoration: InputDecoration(labelText: 'Section Name'),
                    ),
                     Column(
                       children: <Widget>[
                         Row(
                           children: [
                              
                DropdownButton<String>(
                onTap: () {},
                value: category,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Color(0xff01a3a4),
                ),
                underline: Container(
                  height: 2,
                  color: Color(0xff01a3a4),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    category = newValue;
                             
                     
                  });
                },
                items: <String>[
                  'Age 2',
                  'Age 3',
                  'Age 4-5',
                  'Age 6',
                   
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                              value,
                              style: TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
              ),
              
            
                           ],
                         ),
                         
                       ],
                     ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Select Video Cover Image"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: IconButton(
                          color: Color(0xff192a56),
                          icon: Icon(
                            Icons.camera,
                            size: 50,
                          ),
                          onPressed: () {
                            choiceImagefromGallery();
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: _image == null
                          ? Text('No Image Selected')
                          : Text('Image Selected'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Select video to Upload"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: IconButton(
                          color: Color(0xff192a56),
                          icon: Icon(
                            Icons.file_upload,
                            size: 70,
                          ),
                          onPressed: () {
                            choiceFile();
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: _file == null
                          ? Text('No video Selected')
                          : Text('video Selected'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      padding: EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                          color: Color(0xff192a56),
                          child: Text(
                            "Upload video",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            uploadbook();
                          }),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_getTextFields() {
  return Expanded(
    flex: 3,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 1,
        ),
      ],
    ),
  );
}

class BackgroundEvents extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.grey.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Color(0xff01a3a4);
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.grey.shade300;
    ;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BackgroundEvent extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Color(0xff01a3a4);
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.55, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.white38;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Color(0xffdfe6e9);
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
