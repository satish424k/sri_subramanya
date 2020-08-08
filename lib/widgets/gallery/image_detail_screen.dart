import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageDetailScreen extends StatefulWidget {
  final String imageUrl;
  final AsyncSnapshot snapshot;
  final int currentImageIndex;

  ImageDetailScreen({
    Key key,
    this.imageUrl,
    this.snapshot,
    this.currentImageIndex,
  }) : super(key: key);

  @override
  _ImageDetailScreenState createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xff000428),
            padding:
                EdgeInsets.only(top: 80.0, left: 8.0, right: 8.0, bottom: 20),
            child: Swiper(
              itemCount: widget.snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final indexNumber =
                    isFirstTime ? widget.currentImageIndex : index;

                if (isFirstTime) {
                  isFirstTime = false;
                }

                return Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white))),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget
                              .snapshot.data[indexNumber].data['image_url'],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackButton(color: Colors.white),
          )
        ],
      ),
    );
  }
}
