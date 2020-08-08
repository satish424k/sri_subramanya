import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';

class NoInternetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 225,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/no_internet.png'),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No Internet connection.',
                style: FontStyle().getBoldFontStyle(20, Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please make sure that WiFi or mobile data is turned on, then try again.',
                style: FontStyle().getRegularFontStyle(18, Colors.black),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
