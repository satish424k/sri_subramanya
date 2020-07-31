import 'package:flutter/material.dart';

import '../../models/story.dart';
import '../../utils/fonts.dart';
import 'summary_screen.dart';

class DetailScreen extends StatelessWidget {
  final Story story;

  DetailScreen(this.story);
  
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
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 32.0),
        children: <Widget>[
          Summary(story),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text(
                //   'వృత్తాంతం',
                //   style:
                //       FontStyle().getTeluguRegularFontStyle(25, Colors.white),
                // ),
                // Separator(),
                Text(
                  story.content,
                  style:
                      FontStyle().getTeluguRegularFontStyle(22, Colors.white, 1.2), textAlign: TextAlign.justify,
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
