import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/gallery_screen.dart';
import 'package:kavadi_ustav_2020/widgets/music/music_list_screen.dart';
import 'package:kavadi_ustav_2020/widgets/music/music_player_screen.dart';
import 'package:marquee/marquee.dart';

import '../../utils/data.dart';
import '../../utils/fonts.dart';
import '../../utils/routes.dart';
import 'dash_board_grid_item.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/header.png'),
                        radius: 76,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                    children:
                        List.generate(Data.homeCardTitles.length, (index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: DashBoardGridItem(
                            title: Data.homeCardTitles[index],
                            image: Data.homeCardImages[index],
                            callback: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GalleryScreen(
                                              path: 'live_2020',
                                              imageCount: 5,
                                            )),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GalleryScreen(
                                                path: 'gallery_2019',
                                                imageCount: 7,
                                              )));
                                  break;
                                case 2:
                                  print('TODO');
                                  break;
                                case 3:
                                  Navigator.pushNamed(
                                      context, Routes.storySelectionScreen);
                                  break;
                                case 4:
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => MusicListScreen()));
                                  break;
                                default:
                              }
                            },
                          )),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFF004e92),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 30.0,
                color: Color(0xFF004e92),
                child: Marquee(
                  text: Data.ashtottaraSataNamavali,
                  style:
                      FontStyle().getTeluguRegularFontStyle(23, Colors.white),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 1),
                  showFadingOnlyWhenScrolling: true,
                  fadingEdgeStartFraction: 0.1,
                  fadingEdgeEndFraction: 0.1,
                  numberOfRounds: 3,
                )),
          ),
        ),
      ),
    );
  }
}
