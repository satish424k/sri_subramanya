import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/utils/content_type.dart';

import '../../models/story.dart';
import '../../utils/data.dart';
import '../common/content_selection_card.dart';
import '../common/detail_screen.dart';

class ContentSelectionScreen extends StatelessWidget {
  final String folderPath;
  final ContentType contentType;

  ContentSelectionScreen(
      {@required this.folderPath, @required this.contentType});

  Future getData() async {
    QuerySnapshot qn =
        await Firestore.instance.collection(this.folderPath).getDocuments();
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
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
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
                              title: snapshot.data[index].data['name'],
                              image: Data.storyImages[index],
                              callback: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        _fetchStory(
                                            index,
                                            snapshot.data[index]
                                                .data['description'],
                                            snapshot.data[index].data['place'],
                                            snapshot.data[index].data['name']),
                                        this.contentType),
                                  ),
                                );
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
            _getToolbar(context)
          ],
        ),
      ),
    );
  }

  Story _fetchStory(int index, String description, String place, String name) {
    return Story(
        title: name,
        subtitle: place,
        content: description,
        image: Data.storyImages[index]);
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
