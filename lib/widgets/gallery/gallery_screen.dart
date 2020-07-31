import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/image_grid_item.dart';
// import 'package:kavadi_ustav_2020/widgets/gallery/live_photos_grid_item.dart';
import 'package:connectivity/connectivity.dart';

class GalleryScreen extends StatefulWidget {
  final String path;
  final int imageCount;

  GalleryScreen({@required this.path, @required this.imageCount});
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String connectivityState;
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {});
      } else if (result == ConnectivityResult.none) {
        connectivityState = result.toString();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  Future getData() async {
    QuerySnapshot qn =
        await Firestore.instance.collection('images').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
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
      child: AnimationLimiter(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8, 70, 8, 32),
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (connectivityState == '') {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('No Internet')));
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.count(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 32),
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      children: List.generate(snapshot.data.length, (index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageGridItem(
                                    imageUrl:
                                        snapshot.data[index].data['image_url']),
                              ),
                            ),
                          ),
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
      ),
    ));
  }
}
