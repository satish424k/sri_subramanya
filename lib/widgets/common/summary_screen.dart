import 'package:flutter/material.dart';

import '../../models/story.dart';
import '../../utils/fonts.dart';
import '../seperator.dart';

class Summary extends StatelessWidget {
  final Story story;

  Summary(this.story);

  @override
  Widget build(BuildContext context) {
    final imageThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.center,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/${story.image}'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
            color: Color.fromRGBO(113, 92, 85, 1)),
      ),
    );

    final summaryCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 10.0),
          new Text(story.title,
              style: FontStyle().getTeluguRegularFontStyle(25, Colors.white)),
          Separator(),
          new Container(height: 10.0),
          new Text(story.subtitle,
              style: FontStyle().getTeluguRegularFontStyle(18, Colors.white)),
        ],
      ),
    );

    final summaryCard = new Container(
      child: summaryCardContent,
      height: 165.0,
      margin: EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xffc33764), Color(0xFF1d2671)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
        // color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          summaryCard,
          imageThumbnail,
        ],
      ),
    );
    // );
  }
}
