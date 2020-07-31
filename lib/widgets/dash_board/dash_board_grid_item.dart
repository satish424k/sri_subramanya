import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/fonts.dart';

class DashBoardGridItem extends StatelessWidget {
  final String title;
  final String image;
  final Function callback;

  DashBoardGridItem({this.title, this.image, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          // color: Color(0xff799F0C),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF00416A),
              Color(0xff799F0C),
              Color(0xffFFE000)
            ],
            stops: [0.0, 0.6, 0.9],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            callback();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/$image'),
                    radius: 53,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  title,
                  style: FontStyle()
                      .getTeluguRegularFontStyle(25, Color(0xff000428)),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
