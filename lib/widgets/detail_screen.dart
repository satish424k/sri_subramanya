import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/models/story.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/widgets/seperator.dart';
import 'package:kavadi_ustav_2020/widgets/summary_screen.dart';

class DetailScreen extends StatelessWidget {
  final Story story;

  DetailScreen(this.story);

  // #000428 → #004e92

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
        // color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            // _getBackground(),
            // _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
        constraints: BoxConstraints.expand(height: 295.0),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/vel.jpg'),
          fit: BoxFit.cover,
        )));
  }

  

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x0042275a), Color(0xFF734b6d)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
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
                Text(
                  'వృత్తాంతం',
                  style:
                      FontStyle().getTeluguRegularFontStyle(25, Colors.white),
                ),
                Separator(),
                Text(
                  story.content,
                  style:
                      FontStyle().getTeluguRegularFontStyle(23, Colors.white), textAlign: TextAlign.justify,
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
