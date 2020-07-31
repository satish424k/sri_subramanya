import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/image_detail_screen.dart';

import '../../models/data_holder.dart';

const maxImageSize = 7 * 1024 * 1024;

class LivePhotosGridItem extends StatefulWidget {
  final int index;
  final String path;

  LivePhotosGridItem({@required this.index, @required this.path});

  @override
  _LivePhotosGridItemState createState() => _LivePhotosGridItemState();
}

class _LivePhotosGridItemState extends State<LivePhotosGridItem> {
  Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (imageFile != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen(
                image: Image.memory(imageFile, fit: BoxFit.cover),
              ),
            ),
          );
        }
      },
      child: Container(
        // padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GridTile(
          child: imageFile == null
              ? Center(
                  child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/vel_blur.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ))
                  ],
                ))
              : Image.memory(imageFile, fit: BoxFit.cover),
          // footer: GridTileBar(
          //   title: Text('అభిషేకం'),
          //   subtitle: Text('2019'),
          //   leading: Icon(Icons.event),
          // ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget.index)) {
      getImage();
    } else {
      setState(() {
        imageFile = imageData[widget.index];
      });
    }
  }

  getImage() {
    if (!requestedIndexes.contains(widget.index)) {
      StorageReference photosReference =
          FirebaseStorage.instance.ref().child(widget.path);
      photosReference
          .child('image_${widget.index}.jpeg')
          .getData(maxImageSize)
          .then((data) {
        setState(() {
          imageFile = data;
        });
        imageData.putIfAbsent(widget.index, () {
          return data;
        });
      }).catchError((error) {
        print('[KS] Unable to fetch image with $error');
      });
      requestedIndexes.add(widget.index);
    }
  }
}
