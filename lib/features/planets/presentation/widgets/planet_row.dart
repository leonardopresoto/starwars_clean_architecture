import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';

const Color carContent_TextColor = Colors.white;

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {

    final planetThumbnail = Container(
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage(planet.image!),
        height: 80.0,
        width: 80.0,
      ),
    );

    Widget _planetValue({String? value, required String description}) {
      return Row(children: <Widget>[
        Text(description, style: TextStyle(color: carContent_TextColor),),
        Container(width: 4.0),
        Expanded(
          child: Text(
            (value != null)? value:"n/a",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: carContent_TextColor),
          ),
        ),
      ]);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.only(left: 60.0, top: 8, right: 8.0, bottom: 8),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(planet.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carContent_TextColor),),
          Row(children: <Widget>[
            Text("Population : ", style: TextStyle(color: carContent_TextColor),),
            SizedBox(height: 20),
            Text(planet.population!, style: TextStyle(fontWeight: FontWeight.bold,color: carContent_TextColor) ),
          ],),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 50.0,
            color: YELLOW_STARWARS,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: _planetValue(
                      value: planet.diameter, description: "Diameter :")),
              Expanded(
                  child: _planetValue(
                      value: planet.gravity, description: 'Gravity : '))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      margin: EdgeInsets.only(left: 25.0),
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
        height: 100.0,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
