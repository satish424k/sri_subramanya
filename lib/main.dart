import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/services/connectivity_service.dart';
import 'package:kavadi_ustav_2020/utils/connectivity.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/gallery_screen.dart';
import 'package:kavadi_ustav_2020/widgets/home/home_screen.dart';

import 'utils/routes.dart';
import 'widgets/stories/story_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // StreamProvider<ConnectivityStatus>(
        //   builder: (context) => ConnectivityService().connectionStatusController,
        //   child:

        MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        Routes.storySelectionScreen: (context) => StorySelectionScreen(),
        Routes.galleryScreen: (context) => GalleryScreen()
      },
    );
    // );
  }
}
