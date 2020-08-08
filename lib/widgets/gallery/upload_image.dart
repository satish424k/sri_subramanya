import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadImage extends StatefulWidget {
  final String folderName;

  UploadImage({@required this.folderName});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  TextEditingController imageName = TextEditingController();
  File image;
  String imagePath;
  var imageDownUrl;
  StorageReference ref;
  final fireStoreInstance = Firestore.instance;
  Color buttonColor = Colors.red;
  bool updateInProgress = false;

  void selectImage() async {
    image = await FilePicker.getFile();

    setState(() {
      image = image;

      if (image != null) {
        imagePath = basename(image.path);
        uploadImage(image.readAsBytesSync(), imagePath);
      }
    });
  }

  void uploadImage(List<int> image, String imagePath) async {
    ref = FirebaseStorage.instance.ref().child(imagePath);
    StorageUploadTask uploadTask = ref.putData(image);
    imageDownUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    setState(() {
      buttonColor = Colors.green;
    });
  }

  finalUpload() async {
    var data = {
      'image_name': imageName.text,
      'image_url': imageDownUrl.toString(),
    };

    if (imageName.text != "" &&
        imageName.text != null &&
        imageDownUrl.toString() is String &&
        imageDownUrl != null) {
      setState(() {
        updateInProgress = true;
      });

      await fireStoreInstance
          .collection(widget.folderName)
          .document()
          .setData(data);

      setState(() {
        updateInProgress = false;
      });
    } else {
      setState(() {
        buttonColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: updateInProgress
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
                    stops: [0.0, 0.9],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0, top: 70),
                      child: Center(
                        child: Container(
                          height: height / 3,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      selectImage();
                                    },
                                    child: Text('Select Image'),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextField(
                                    controller: imageName,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Image Name',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent, width: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  RaisedButton(
                                    color: buttonColor,
                                    onPressed: finalUpload,
                                    child: Text('Upload'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: BackButton(color: Colors.white),
                    )
                  ],
                ),
              ));
  }
}
