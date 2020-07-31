import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String songName;
  final String songUrl;

  MusicPlayerScreen({@required this.songName, @required this.songUrl});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  String mp3Uri = '';
  bool firstTime = true;
  String currentTimeString = '00:00';
  String completeTimeString = '00:00';
  double currentTime = 0.0;
  double completeTime = 0.0;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadSound();

    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.inSeconds.toDouble();
        currentTimeString = duration.toString().split('.')[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.inSeconds.toDouble();
        completeTimeString = duration.toString().split('.')[0];
      });
    });
  }

  void _loadSound() async {
    final ByteData data = await rootBundle.load('assets/audios/song1.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/song1.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await audioPlayer.stop();
        setState(() {
          _isPlaying = false;
        });
        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
                  stops: [0.0, 0.9],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x46000000), //TODO
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                                blurRadius: 30),
                            BoxShadow(
                                color: Color(0x11000000), //TODO
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                                blurRadius: 30)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('assets/images/vel.jpg'),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.width * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(widget.songName,
                        style: FontStyle()
                            .getTeluguRegularFontStyle(25, Colors.white)),
                    SizedBox(height: 20),
                    Slider(
                      onChanged: (double value) {
                        Duration newDuration = Duration(seconds: value.toInt());

                        setState(() {
                          audioPlayer.seek(newDuration);
                          value = value;
                        });
                      },
                      value: currentTime,
                      max: completeTime,
                      min: 0.0,
                      activeColor: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(currentTimeString,
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(completeTimeString,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.backward,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          iconSize: 50,
                          onPressed: () async {
                            if (_isPlaying) {
                              audioPlayer.pause();

                              setState(() {
                                _isPlaying = false;
                              });
                            } else {
                              if (firstTime) {
                                await audioPlayer.play(widget.songUrl);
                                firstTime = false;
                              } else {
                                audioPlayer.resume();
                              }

                              setState(() {
                                _isPlaying = true;
                              });
                            }

                            // if (status == 1) {
                            //   setState(() {
                            //     _isPlaying = true;
                            //   });
                            // }

                            // _isPlaying
                            //     ? _assetsAudioPlayer.play()
                            //     : _assetsAudioPlayer.pause();
                          },
                          icon: Icon(
                              _isPlaying
                                  ? FontAwesomeIcons.pause
                                  : FontAwesomeIcons.play,
                              color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.forward,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: InkWell(
                onTap: () async {
                  await audioPlayer.stop();

                  setState(() {
                    _isPlaying = false;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Icon(
                    FontAwesomeIcons.angleDown,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer = null;
    super.dispose();
  }
}
