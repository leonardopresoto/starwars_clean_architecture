import 'package:flutter/material.dart';

class FilmCarouselItem extends StatelessWidget {
  final String? title;
  final String? image;

  FilmCarouselItem(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset(image!, fit: BoxFit.cover, width: 1000.0)),
    );
  }
}
