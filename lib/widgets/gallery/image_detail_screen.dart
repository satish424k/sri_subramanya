import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final Image image;

  const ImageDetailScreen({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Color(0xff000428),
          padding: EdgeInsets.only(top: 80.0, left: 8.0, right: 8.0, bottom: 20),
          child: Center(child: image),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: BackButton(color: Colors.white),
        )
      ],
    ));
  }
}
