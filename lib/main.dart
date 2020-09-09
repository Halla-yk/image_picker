import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage:  _imageFile == null ? null :FileImage(File(_imageFile.path)),
                radius: 80,
              ),
              GestureDetector(onTap:  () async =>
              await pickImage(), child: Icon(Icons.camera_alt))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {

                  },
                  child: Text('Upload Image'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: (){},
                child: Text('Load Image'),
              )
            ],
          )
        ],
      ),


    );
  }

  Future pickImage() async{
    var image =await _picker.getImage(source: ImageSource.gallery);
   // var image =await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile =image;
    });
  }
}
