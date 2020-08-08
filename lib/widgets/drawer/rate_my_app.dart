import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/widgets/dash_board/dash_board.dart';
import 'package:kavadi_ustav_2020/widgets/dash_board/dash_board_2.dart';
import 'package:kavadi_ustav_2020/widgets/drawer/feed_back_screen.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:store_redirect/store_redirect.dart';

class RateMyAppScreen extends StatefulWidget {
  @override
  _RateMyAppScreenState createState() => _RateMyAppScreenState();
}

class _RateMyAppScreenState extends State<RateMyAppScreen> {
  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyAppScreen_',
    minDays: 7,
    minLaunches: 10,
    remindDays: 7,
    remindLaunches: 10,
    // googlePlayIdentifier: 'fr.skyost.example',
    // appStoreIdentifier: '1491556149',
  );

  @override
  void initState() {
    super.initState();

    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        _rateMyApp.showStarRateDialog(
          context,
          title: 'Rate Our App',
          message: 'If you love our App, please take a moment to rate it:',
          actionsBuilder: (context, stars) {
            return [
              FlatButton(
                onPressed: () async {
                  _rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
                  Navigator.pop(context);
                },
                child: Text(
                  'Later',
                  style: FontStyle().getBoldFontStyle(18, Color(0xff000428)),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if (stars != null) {
                    await _rateMyApp
                        .callEvent(RateMyAppEventType.rateButtonPressed);
                    Navigator.pop<RateMyAppDialogButton>(
                        context, RateMyAppDialogButton.rate);
                  } else {
                    Navigator.pop(context);
                  }

                  if (stars <= 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FeedBackScreen()));
                  } else if (stars <= 5) {
                    StoreRedirect.redirect(
                        androidAppId: '' /*'com.iyaffle.rangoli'*/);
                  }
                },
                child: Text('Rate',
                    style: FontStyle().getBoldFontStyle(
                      18,
                      Color(0xff000428),
                    )),
              ),
            ];
          },
          ignoreIOS: false,
          dialogStyle: DialogStyle(
            titleStyle: FontStyle().getBoldFontStyle(18, Color(0xff000428)),
            titleAlign: TextAlign.center,
          ),
          starRatingOptions: StarRatingOptions(
              starsFillColor: Color(0xFF004e92),
              allowHalfRating: false,
              starsSize: 50,
              starsBorderColor: Color(0xFF004e92)),
          onDismissed: () =>
              _rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dashboard2();
  }
}
