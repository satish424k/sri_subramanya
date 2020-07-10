import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kavadi_ustav_2020/models/data_holder.dart';

const maxImageSize = 7 * 1024 * 1024;

class LivePhotosGridItem extends StatefulWidget {
  int _index;

  LivePhotosGridItem(int index) {
    this._index = index;
  }

  @override
  _LivePhotosGridItemState createState() => _LivePhotosGridItemState();
}

class _LivePhotosGridItemState extends State<LivePhotosGridItem> {
  Uint8List imageFile;
  StorageReference photosReference =
      FirebaseStorage.instance.ref().child('photos');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GridTile(
          child: imageFile == null
              ? Center(child: Text('Loading...'))
              : Image.memory(imageFile, fit: BoxFit.cover),
              /*
              footer: GridTileBar(
                title: Text(',dnfb,dsb'),
                subtitle: Text('JHDJHF'),
                leading: Icon(Icons.event_note),
              ),
              */
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (!imageData.containsKey(widget._index)) {
      getImage();
    } else {
      setState(() {
        imageFile = imageData[widget._index];
      });
    }
  }

  getImage() {
    if (!requestedIndexes.contains(widget._index)) { 
      photosReference
          .child('image_${widget._index}.jpg')
          .getData(maxImageSize)
          .then((data) {
        setState(() {
          imageFile = data;
        });
        imageData.putIfAbsent(widget._index, () {
          return data;
        });
      }).catchError((error) {
        print('Error');
      });
      requestedIndexes.add(widget._index);
    }
  }
}
