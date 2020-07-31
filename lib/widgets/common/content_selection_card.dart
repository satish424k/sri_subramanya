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
    List<Color> _colors = [Color(0xffaa076b), Color(0xff61045f)];
    List<double> _stops = [0.0, 0.7];

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
                  gradient: LinearGradient(colors: _colors, stops: _stops),
                  color: Color(0xFF333366),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    )
                  ]),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Container(
                        child: Text(title,
                            style: FontStyle().getTeluguRegularFontStyle(
                                25.0, Colors.white))),
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
