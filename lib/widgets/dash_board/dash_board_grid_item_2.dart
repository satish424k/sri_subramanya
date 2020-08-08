import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/utils/AppColors.dart';

class DashboardGridItem2 extends StatefulWidget {
  @override
  _DashboardGridItem2State createState() => _DashboardGridItem2State();
}

class _DashboardGridItem2State extends State<DashboardGridItem2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Icon(Icons.favorite),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(200),
        ),
        border: Border.all(width: 2, color: AppColors.mainColor),
        boxShadow: [
          BoxShadow(
              color: AppColors.lightBlueShadow,
              blurRadius: 10,
              offset: Offset(5, 5),
              spreadRadius: 3),
          BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              offset: Offset(-5, -5),
              spreadRadius: 3),
        ],
        gradient: RadialGradient(
          colors: [
            AppColors.mainColor,
            AppColors.mainColor,
            AppColors.mainColor,
            AppColors.mainColor,
            Colors.white
          ],
        ),
      ),
    );
  }
}
