import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/models/story.dart';
import 'package:kavadi_ustav_2020/widgets/content_selection_card.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/utils/data.dart';
import 'package:kavadi_ustav_2020/widgets/detail_screen.dart';

class StorySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(131, 108, 246, 1),
      //   title: Center(
      //       child: Text(
      //     'శ్రీ సుబ్రహ్మణ్య స్వామి స్థల పురాణములు',
      //     style: FontStyle().getTeluguRegularFontStyle(25, Colors.white),
      //   )),
      // ),
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
          // color: Color.fromRGBO(222, 222, 222, 1),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 32),
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
                        index: index,
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
      content: Data.storiesContent[0],
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
