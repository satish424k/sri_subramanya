import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:kavadi_ustav_2020/widgets/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(131, 108, 246, 1),
        title: Center(child: Text('శ్రీ సుబ్రహ్మణ్య', style: FontStyle().getTeluguRegularFontStyle(30, Colors.white),)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                //TODO: Handle settings
              },
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return DrawerHeader(
                child: Container(
                  child: Image.asset(
                    'assets/images/vel.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else if (index == 1) {
              return ListTile(
                title: Text('Subramanya Aradhana Stotrams'),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            } else if (index == 2) {
              return ListTile(
                title: Text('Feed Back'),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            } else if (index == 3) {
              return ListTile(
                title: Text('App Version'),
                trailing: Icon(Icons.info),
              );
            } else {
              return ListTile();
            }
          },
        ),
      ),
      body: WelcomeScreen(),
    );
  }
}
