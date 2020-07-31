import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kavadi_ustav_2020/widgets/home/settings_screen.dart';

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
            child: Text(
          'శ్రీ సుబ్రహ్మణ్యం',
          style: FontStyle().getTeluguRegularFontStyle(30, Colors.white),
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.slidersH),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
          //   child: ListView.separated(
          //     itemCount: 3,
          //     separatorBuilder: (BuildContext context, int index) => Divider(),
          //     itemBuilder: (BuildContext context, int index) {
          //       if (index == 0) {
          //         return DrawerHeader(
          //           child: Container(
          //             child: Image.asset(
          //               'assets/images/vel.jpg',
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         );
          //       } else if (index == 1) {
          //         return ListTile(
          //           title: Text('Feed Back'),
          //           trailing: Icon(Icons.arrow_forward_ios),
          //         );
          //       } else if (index == 2) {
          //         return ListTile(
          //           title: Text('App Version'),
          //           trailing: Icon(Icons.info),
          //         );
          //       } else {
          //         return ListTile();
          //       }
          //     },
          //   ),
          ),
      body: DashBoard(),
    );
  }
}
