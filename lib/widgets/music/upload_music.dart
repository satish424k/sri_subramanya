import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadMusic extends StatefulWidget {
  @override
  _UploadMusicState createState() => _UploadMusicState();
}

class _UploadMusicState extends State<UploadMusic> {
  TextEditingController songName = TextEditingController();
  File song;
  String songPath;
  var songDownUrl;
  StorageReference ref;
  final fireStoreInstance = Firestore.instance;
  Color buttonColor = Colors.red;
  bool updateInProgress = false;

  void selectSong() async {
    song = await FilePicker.getFile();

    setState(() {
      song = song;

      if (song != null) {
        songPath = basename(song.path);
        uploadSong(song.readAsBytesSync(), songPath);
      }
    });
  }

  void uploadSong(List<int> song, String songPath) async {
    ref = FirebaseStorage.instance.ref().child(songPath);
    StorageUploadTask uploadTask = ref.putData(song);
    songDownUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    setState(() {
      buttonColor = Colors.green;
    });
  }

  finalUpload() async {
    var data = {
      'song_name': songName.text,
      'song_url': songDownUrl.toString(),
    };

    if (songName.text != "" &&
        songName.text != null &&
        songDownUrl.toString() is String) {
      setState(() {
        updateInProgress = true;
      });

      await fireStoreInstance.collection('songs').document().setData(data);

      setState(() {
        updateInProgress = false;
      });
    } else {
      setState(() {
        buttonColor = Colors.red;
      });
    }
  }

  //TODO:
  List<Widget> _fetchUploadInfo() {
    final songNameWidget = Text(songName.text);
    final songUrlWidget = Text(songDownUrl.toString());
    return [songNameWidget, songUrlWidget];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: updateInProgress
            ? CircularProgressIndicator()
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
                      child: Container(
                        height: 200,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: selectSong,
                                  child: Text('Select Song'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: songName,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Song Name',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
