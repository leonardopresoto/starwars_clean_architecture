import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';
import 'package:starwars_clean_architecture/features/starships/presentation/widgets/starship_card.dart';


const String SCREEN_TITLE = "List of Starships";

class LoadedList extends StatelessWidget {
  const LoadedList({
    Key? key,
    required this.starshipList,
  }) : super(key: key);

  final List<Starship> starshipList;

  @override
  Widget build(BuildContext context) {
    return StarshipListPage(starshipList: starshipList);
  }
}

class StarshipListPage extends StatefulWidget {
  const StarshipListPage({
    Key? key,
    required this.starshipList,
  }) : super(key: key);

  final List<Starship> starshipList;

  @override
  State createState() {
    return StarshipListPageState();
  }
}

class StarshipListPageState extends State<StarshipListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildStatusPage(widget.starshipList);
  }

  StatelessWidget _buildStatusPage(List<Starship> starshipList) {
    return _buildExpandableTheme(starshipList);
  }

  ExpandableTheme _buildExpandableTheme(List<Starship> starshipList) {
    return ExpandableTheme(
            data: ExpandableThemeData(
              iconColor: Theme.of(context).accentIconTheme.color,
              useInkWell: true,
            ),
            child: Container(
              height: Utils().screenSafeAreaHeight(context) - 24,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  for (var starship in starshipList) StarShipCard(starship),
                ],
              ),
            ),
          );
  }
}

