import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/widgets/planet_row.dart';

const Color carContent_TextColor = Colors.white;

class PlanetCard extends StatefulWidget {
  final Planet planet;

  PlanetCard(this.planet);

  @override
  _PlanetCardState createState() => _PlanetCardState();
}

class _PlanetCardState extends State<PlanetCard> {
  @override
  Widget build(BuildContext context) {
    final PlanetRow planetRow = PlanetRow(widget.planet);
    return planetRow;
  }
}
