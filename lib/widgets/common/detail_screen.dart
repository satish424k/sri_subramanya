import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/content_type.dart';

import '../../models/story.dart';
import '../../utils/fonts.dart';
import 'story_summary_card.dart';

class DetailScreen extends StatelessWidget {
  final Story story;
  final ContentType contentType;

  DetailScreen(this.story, this.contentType);

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
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getContent() {
    final String storyText = story.content.replaceAll(RegExp(r'\\n'), '\n');

    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 32.0),
        children: <Widget>[
          StorySummaryCard(story, this.contentType),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  storyText,
                  style: FontStyle()
                      .getTeluguRegularFontStyle(22, Colors.white, 1.2),
                  textAlign: (this.contentType == ContentType.Stories)
                      ? TextAlign.justify
                      : TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
