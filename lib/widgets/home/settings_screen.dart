import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/upload_image.dart';
import 'package:kavadi_ustav_2020/widgets/music/upload_music.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              ListView(
                padding: EdgeInsets.only(left: 16.0, top: 70.0, right: 8.0),
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.music),
                      title: Text('Upload Song'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadMusic(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.image),
                      title: Text('Upload Image'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadImage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: BackButton(color: Colors.white),
              )
            ],
          )),
    );
  }
}
