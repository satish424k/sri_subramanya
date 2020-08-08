import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/utils/connectivity.dart';
import 'package:kavadi_ustav_2020/utils/data.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/widgets/common/content_selection_card.dart';
import 'package:kavadi_ustav_2020/widgets/common/no_internet_card.dart';
import 'package:kavadi_ustav_2020/widgets/music/music_player_screen.dart';
import 'package:provider/provider.dart';

class MusicListScreen extends StatefulWidget {
  @override
  _MusicListScreenState createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  Future getData() async {
    QuerySnapshot qn =
        await Firestore.instance.collection('songs').getDocuments();
    return qn.documents;
  }

  String _fetchRandomImage() {
    final random = Random();
    return Data.subramanyaImages[random.nextInt(Data.subramanyaImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    var connectivityStatus = Provider.of<ConnectivityStatus>(context);

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
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final image = _fetchRandomImage();
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: ScaleAnimation(
                              child:

                                  // Container(
                                  //   // color: Colors.grey.shade200.withOpacity(0.3),
                                  //   height: 100,
                                  //   child: Card(
                                  //     color: Colors.grey.shade200.withOpacity(0.3),
                                  //     shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(10))),
                                  //     elevation: 10,
                                  //     child: Center(
                                  //       child: ListTile(
                                  //         title: Text(
                                  //           snapshot.data[index].data['song_name'],
                                  //           style: FontStyle()
                                  //               .getTeluguRegularFontStyle(
                                  //                   23, Colors.white),
                                  //         ),
                                  //         leading: CircleAvatar(
                                  //           radius: 25,
                                  //           backgroundColor: Colors.yellow,
                                  //           backgroundImage:
                                  //               AssetImage('assets/images/$image'),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  ContentSelectionCard(
                                title: snapshot.data[index].data['song_name'],
                                image: image,
                                callback: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MusicPlayerScreen(
                                            imageName: image,
                                            songName: snapshot
                                                .data[index].data['song_name'],
                                            songUrl: snapshot
                                                .data[index].data['song_url']),
                                      ));
                                },
                              ),
                            ),
                          ),
                        );
                      },
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
    );
  }
}
