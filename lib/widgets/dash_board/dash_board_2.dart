import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/AppColors.dart';
import 'package:kavadi_ustav_2020/widgets/dash_board/dash_board_grid_item_2.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Center(
          child: DashboardGridItem2(),
        ));
  }
}
