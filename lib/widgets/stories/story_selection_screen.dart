import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../models/story.dart';
import '../../utils/data.dart';
import '../common/content_selection_card.dart';
import '../common/detail_screen.dart';

class StorySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: Container(
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
              ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 32),
              itemCount: Data.storyTitles.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      child: ContentSelectionCard(
                        title: Data.storyTitles[index],
                        image: Data.storyImages[index],
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(_fetchStory(index)),
                              ));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            _getToolbar(context)
            ],
          ),
        ),
      ),
    );
  }

  Story _fetchStory(int index) {
    return Story(
      title: Data.storyTitles[index],
      subtitle: 'తమిళనాడు',
      content: Data.storiesContent[index],
      image: Data.storyImages[index]
    );
  }

    Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
