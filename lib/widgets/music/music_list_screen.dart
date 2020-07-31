import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/widgets/common/content_selection_card.dart';
import 'package:kavadi_ustav_2020/widgets/music/music_player_screen.dart';

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
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8, 70, 8, 32),
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 70, 0, 32),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: ScaleAnimation(
                              child: ContentSelectionCard(
                                title: snapshot.data[index].data['song_name'],
                                image: 'vel.jpg',
                                callback: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MusicPlayerScreen(
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
