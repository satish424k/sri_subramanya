import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  final String imageUrl;

  ImageGridItem({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridTile(child: Image.network(imageUrl)),
    );
  }
}
