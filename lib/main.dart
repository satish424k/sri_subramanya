import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/routes.dart';
import 'package:kavadi_ustav_2020/widgets/detail_screen.dart';
import 'package:kavadi_ustav_2020/widgets/home_screen.dart';
import 'package:kavadi_ustav_2020/widgets/story_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        Routes.storySelectionScreen : (context) => StorySelectionScreen(),
      },
    );
  }
}
