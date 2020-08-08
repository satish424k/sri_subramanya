import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/services/connectivity_service.dart';
import 'package:kavadi_ustav_2020/utils/connectivity.dart';
import 'package:kavadi_ustav_2020/widgets/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) => ConnectivityService().statusStream(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
