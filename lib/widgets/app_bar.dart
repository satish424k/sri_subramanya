import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: Center(
        child: Text(title,
            style: FontStyle().getBoldFontStyle(28.0, Colors.white)),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
