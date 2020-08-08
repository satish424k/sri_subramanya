import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/content_type.dart';

import '../../models/story.dart';
import '../../utils/fonts.dart';
import '../seperator.dart';

class StorySummaryCard extends StatelessWidget {
  final Story story;
  final ContentType contentType;

  StorySummaryCard(this.story, this.contentType);

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

    final summaryCardContent = Container(
      margin: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _fetchWidgets(),
      ),
    );

    final summaryCard = Container(
      child: summaryCardContent,
      height: this.contentType == ContentType.Stories
          ? MediaQuery.of(context).size.height / 4
          : MediaQuery.of(context).size.height / 5,
      margin: EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xffFFE000),
            Color(0xff799F0C),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          summaryCard,
          imageThumbnail,
        ],
      ),
    );
  }

  List<Widget> _fetchWidgets() {
    List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(story.title,
            style: FontStyle().getTeluguRegularFontStyle(25, Colors.black)),
      ),
    ];

    if (this.contentType == ContentType.Stories) {
      widgetList.add(Separator());
      widgetList.add(Text(story.subtitle,
          style: FontStyle().getTeluguRegularFontStyle(18, Colors.black)));
    }

    return widgetList;
  }
}
