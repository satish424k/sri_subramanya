import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kavadi_ustav_2020/widgets/drawer/about_app_screen.dart';
import 'package:kavadi_ustav_2020/widgets/drawer/contact_screen.dart';
import 'package:kavadi_ustav_2020/widgets/drawer/feed_back_screen.dart';
import 'package:kavadi_ustav_2020/widgets/drawer/rate_my_app.dart';
import 'package:kavadi_ustav_2020/widgets/music/music_player_screen_1.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share/share.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../utils/fonts.dart';
import '../dash_board/dash_board.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000428),
        title: Center(
            child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage('assets/images/header.png'),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Text(
              'శ్రీ సుబ్రహ్మణ్యం',
              style: FontStyle().getTeluguRegularFontStyle(30, Colors.white),
            ),
          ],
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.cog),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => /*SettingsScreen()*/ BGAudioPlayerScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            ),
          ),
          child: ListView.separated(
            itemCount: 6,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return DrawerHeader(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/header.png'),
                      radius: 65,
                    ),
                  ),
                );
              } else if (index == 1) {
                return ListTile(
                  title: Text('About',
                      style: FontStyle().getRegularFontStyle(18, Colors.white)),
                  leading: Icon(Icons.info, color: Colors.white),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AboutAppScreen()));
                  },
                );
              } else if (index == 2) {
                return ListTile(
                  title: Text('Contact',
                      style: FontStyle().getRegularFontStyle(18, Colors.white)),
                  leading: Icon(Icons.contact_mail, color: Colors.white),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ContactScreen()));
                  },
                );
              } else if (index == 3) {
                return ListTile(
                  title: Text('Share',
                      style: FontStyle().getRegularFontStyle(18, Colors.white)),
                  leading: Icon(Icons.share, color: Colors.white),
                  onTap: () {
                    Share.share('Please install this app.');
                  },
                );
              } else if (index == 4) {
                return ListTile(
                  leading: Icon(Icons.feedback, color: Colors.white),
                  title: Text(
                    'Suggestions & Feed Back',
                    style: FontStyle().getRegularFontStyle(18, Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedBackScreen(),
                      ),
                    );
                  },
                );
              } else if (index == 5) {
                return ListTile(
                  title: Text('Rate App',
                      style: FontStyle().getRegularFontStyle(18, Colors.white)),
                  subtitle: Text('App Version - 1.0.0 (1)',
                      style: FontStyle().getRegularFontStyle(14, Colors.white)),
                  leading: Icon(Icons.rate_review, color: Colors.white),
                  onTap: () {
                    StoreRedirect.redirect(
                        androidAppId: '' /*'com.iyaffle.rangoli'*/); //TODO
                  },
                );
              } else {
                return ListTile();
              }
            },
          ),
        ),
      ),
      body: RateMyAppScreen(),
    );
  }
}
