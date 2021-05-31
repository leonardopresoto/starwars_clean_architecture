import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage(planet.image!),
        height: 75.0,
        width: 75.0,
      ),
    );

    Widget _planetValue({String? value, required String description}) {
      return Row(children: <Widget>[
        Text(
          description,
          style: TextStyle(color: planet_TextColor),
        ),
        Container(width: 2.0),
        Expanded(
          child: Text(
            (value != null) ? value : "n/a",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: planet_TextColor),
          ),
        ),
      ]);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.only(left: 45.0, top: 8),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            planet.name!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: planet_TextColor),
          ),
          Row(
            children: <Widget>[
              Text(
                "Population : ",
                style: TextStyle(color: planet_TextColor),
              ),
              SizedBox(height: 20),
              Text(bigNumberFormatter(planet.population).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: planet_TextColor)),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 80.0,
            color: YELLOW_STARWARS,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: _planetValue(
                      value: planet.diameter, description: "Diameter :")),
              Expanded(
                  child: _planetValue(
                      value: gravityFormatter(planet.gravity),
                      description: 'Gravity : '))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      margin: EdgeInsets.only(left: 40.0, right: 5),
      decoration: BoxDecoration(
        color: PLANET_CARD_COLOR,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return Container(
        height: 95.0,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 3.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }

  String? gravityFormatter(String? gravity) {
    if (gravity == "N/A" || gravity == "unknown") {
      return 'Unknown';
    } else if (gravity!.endsWith("City)")) {
      return gravity =
          gravity.replaceAll(" (surface), 1 standard (Cloud City)", "") +
              " std";
    }
    return gravity.replaceAll("standard", "std");
  }

  String? bigNumberFormatter(String? number) {
    try {
      return NumberFormat.compact().format(double.parse(number!)).toString();
    } catch (e) {
      return number;
    }
  }

//
}
