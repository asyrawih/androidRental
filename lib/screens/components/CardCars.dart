import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CardCars extends StatelessWidget {
  final cardStyle = (BuildContext context) => ParentStyle()
    ..margin(top: 10)
    ..border(style: BorderStyle.none)
    ..height(MediaQuery.of(context).size.height - (2 * 300));

  final data;
  CardCars({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: CachedNetworkImage(
        imageUrl: "https://irent.id/uploads/thumb/cars/" + data["gambar"],
        fit: BoxFit.fitHeight,
        placeholder: (context, url) => CircularProgressIndicator(),
      ),
      style: cardStyle(context),
    );
  }
}
