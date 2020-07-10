import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/data.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/widgets/live_photos_grid_item.dart';
import 'package:kavadi_ustav_2020/widgets/talapatra_card.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WelcomeScreen extends StatelessWidget {
  final _talapatraCardTitles = [
    'కావిడి సేవా 2020',
    'శ్రీ సుబ్రమణ్య స్వామి గ్యాలరీ',
    'శ్రీ సుబ్రహ్మణ్య స్తోత్రలు',
    'శ్రీ సుబ్రహ్మణ్య స్వామి చరిత్ర'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(222, 222, 222, 1),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: ScaleAnimation(
                    child: _fetchCard(index),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _fetchCard(int index) {
    if (index == 4) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            height: 25.0,
            // color: Colors.white,
            child: Marquee(
              text: Mantras.ashtottaraSataNamavali,
              style: FontStyle().getTeluguRegularFontStyle(23, Colors.indigo),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 20.0,
              velocity: 30.0,
              pauseAfterRound: Duration(seconds: 1),
              showFadingOnlyWhenScrolling: true,
              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,
              numberOfRounds: 3,
            )),
      );
    } else {
      return Stack(
        children: <Widget>[
          TalapatraCard(_talapatraCardTitles[index], 28.0),
        ],
      );
    }
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              height: 25.0,
              // color: Colors.white,
              child: Marquee(
                text: Mantras.ashtottaraSataNamavali,
                style: FontStyle().getTeluguRegularFontStyle(23, Colors.indigo),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 30.0,
                pauseAfterRound: Duration(seconds: 1),
                showFadingOnlyWhenScrolling: true,
                fadingEdgeStartFraction: 0.1,
                fadingEdgeEndFraction: 0.1,
                numberOfRounds: 3,
              )),
        ),
        Container(
          height: 150.0,
          // color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.fill,
            ),
            // shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}

class LiveUpdatesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 1,
      childAspectRatio: 0.6,
      children: List.generate(
        3,
        (index) {
          return LivePhotosGridItem(index + 1);
        },
      ),
    );
  }
}
