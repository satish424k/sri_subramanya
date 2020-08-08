import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class ContentSelectionCard extends StatelessWidget {
  final title;
  final image;
  final Function callback;

  ContentSelectionCard(
      {@required this.title, @required this.callback, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => callback(),
            child: Container(
              height: 124.0,
              margin: EdgeInsets.only(left: 46.0),
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
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Container(
                        child: Text(title,
                            style: FontStyle().getTeluguRegularFontStyle(
                                25.0, Colors.black))),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/$image'),
                radius: 43,
              ),
            ),
          )
        ],
      ),
    );
  }
}
