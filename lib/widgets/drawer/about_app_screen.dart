import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class AboutAppScreen extends StatelessWidget {
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
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 80, bottom: 40),
                  alignment: FractionalOffset.topCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ganesha.jpg'),
                    radius: 60,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                      'Due to the current situation of Covid-19 pandemic, this year the Kavadi Seva that was supposed to be held on August 12 is being cancelled for the public at large. \n\nWe request all devotees to kindly use this app to see the rituals that are being performed in ’Sri Ganga Meenakshi Sametha Sri Somasundareswara Swami Vari Devastanam’ Arundalpet, Guntur and seek the blessings of the lord Subramanya Swamy from their own residences and help the authorities restrict the spread of the coronavirus.',
                      style: FontStyle().getRegularFontStyle(20, Colors.white),
                      textAlign: TextAlign.justify),
                ),
              ],
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
