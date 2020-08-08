import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/connectivity.dart';
import 'package:kavadi_ustav_2020/widgets/common/no_internet_card.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/image_grid_item.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  final String path;

  GalleryScreen({@required this.path});
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Future getData() async {
    QuerySnapshot qn =
        await Firestore.instance.collection(widget.path).getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    var connectivityStatus = Provider.of<ConnectivityStatus>(context);
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.4;
    final double itemWidth = size.width / 2;

    return Scaffold(
        body: Container(
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
            padding: EdgeInsets.fromLTRB(8, 70, 8, 32),
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (connectivityStatus == ConnectivityStatus.Offline) {
                  return Center(child: NoInternetCard());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                } else {
                  return GridView.count(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 32),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    // childAspectRatio: itemWidth / itemHeight,
                    children: List.generate(snapshot.data.length, (index) {
                      return ImageGridItem(
                        imageUrl: snapshot.data[index].data['image_url'],
                        snapshot: snapshot,
                        currentImageIndex: index,
                      );
                    }),
                  );
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: BackButton(color: Colors.white),
          )
        ],
      ),
    ));
  }
}
