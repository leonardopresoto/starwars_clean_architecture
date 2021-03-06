import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/widgets/planet_card.dart';

const String SCREEN_TITLE = "List of Planets";

class LoadedList extends StatelessWidget {
  const LoadedList({
    Key? key,
    required this.planetList, 
    required this.isLightTheme,
  }) : super(key: key);

  final List<Planet> planetList;
  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    return PlanetListPage(planetList: planetList, isLightTheme: isLightTheme,);
  }
}

class PlanetListPage extends StatefulWidget {
  const PlanetListPage({
    Key? key,
    required this.planetList,
    required this.isLightTheme,
  }) : super(key: key);

  final List<Planet> planetList;
  final bool isLightTheme;

  @override
  State createState() {
    return PlanetListPageState();
  }
}

class PlanetListPageState extends State<PlanetListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildExpandableTheme(widget.planetList);
  }

  ExpandableTheme _buildExpandableTheme(List<Planet> planetList) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        useInkWell: true,
      ),
      child: Container(
        height: Utils().screenSafeAreaHeight(context) - 24,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            for (var planet in planetList) PlanetCard(planet),
          ],
        ),
      ),
    );
  }
}
