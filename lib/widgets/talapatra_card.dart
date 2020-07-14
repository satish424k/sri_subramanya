import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class TalapatraCard extends StatelessWidget {
  final text;
  final fontSize;
  final Function callback;

  TalapatraCard(this.text, this.fontSize, this.callback);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          callback();
        },
              child: Card(
          color: Color.fromRGBO(245, 205, 115, 1),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            // width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(113, 92, 85, 1)),
                ),
                Container(
                  width: 200,
                  child: Center(
                    child: Text(
                      text,
                      style: FontStyle().getTeluguRegularFontStyle(
                          fontSize, Color.fromRGBO(113, 92, 85, 1)),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    VerticalDivider(
                      width: 2,
                      thickness: 3,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    VerticalDivider(
                      width: 2,
                      thickness: 3,
                      color: Colors.orange,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
