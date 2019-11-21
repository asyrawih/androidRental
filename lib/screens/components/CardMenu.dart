import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  Widget _buildUserStats() {
    return Parent(
      style: userStatsStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            child: _buildUserStatsItem(Icons.directions_car, 'Cars'),
            onTap: () {},
          ),
          InkWell(
            child: _buildUserStatsItem(Icons.directions_bus, 'Cars + Driver '),
            onTap: () {},
          ),
          InkWell(
            child: _buildUserStatsItem(Icons.business, 'Bisnis'),
            onTap: () {
              print("bisnis button");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUserStatsItem(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        SizedBox(height: 5),
        Txt(text, style: nameDescriptionTextStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: cardMenuStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[_buildUserStats()],
      ),
    );
  }

  //Styling

  final ParentStyle cardMenuStyle = ParentStyle()
    ..height(175)
    ..padding(horizontal: 20.0, vertical: 10)
    ..alignment.center()
    ..background.hex('#3977FF')
    ..borderRadius(all: 20.0)
    ..elevation(10, color: hex('#3977FF'));

  final ParentStyle userStatsStyle = ParentStyle()..margin(vertical: 10.0);

  final TxtStyle nameDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.white.withOpacity(0.6))
    ..fontSize(12);
}
