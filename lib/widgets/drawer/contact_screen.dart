import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
            stops: [0.0, 0.9],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.addressCard,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Arundalpet, 4th Line, Guntur,\nAndhraPradesh',
                      style: FontStyle().getRegularFontStyle(20, Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      FontAwesomeIcons.locationArrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Open Map',
                      style: FontStyle().getRegularFontStyle(16, Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      FontAwesomeIcons.envelope,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'test@gmail.com',
                      style: FontStyle().getRegularFontStyle(20, Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      FontAwesomeIcons.clock,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Morning \n5am-12pm \nEvening \n5pm-10pm',
                      style: FontStyle().getRegularFontStyle(20, Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: BackButton(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
