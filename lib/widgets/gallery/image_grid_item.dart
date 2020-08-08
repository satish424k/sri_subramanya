import 'package:flutter/material.dart';
import 'package:kavadi_ustav_2020/widgets/gallery/image_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageGridItem extends StatelessWidget {
  final String imageUrl;
  final AsyncSnapshot snapshot;
  final int currentImageIndex;

  ImageGridItem(
      {@required this.imageUrl,
      @required this.snapshot,
      @required this.currentImageIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailScreen(
              imageUrl: imageUrl,
              snapshot: snapshot,
              currentImageIndex: currentImageIndex,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 32 / 2,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
