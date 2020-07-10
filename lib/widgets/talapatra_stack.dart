import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/widgets/talapatra_card.dart';

class TalapatraStack extends StatelessWidget {
  const TalapatraStack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: TalapatraCard('123', 28.0),
          ),
          Positioned(
            top: -10,
            child: TalapatraCard('123', 28.0),
          ),
          Positioned(
            top: -20,
            child: TalapatraCard('123', 28.0),
          ),
          Positioned(
            top: -30,
            child: TalapatraCard('123', 28.0),
          )
        ],
      ),
    );
  }
}
