import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';
import 'package:starwars_clean_architecture/features/species/presentation/widgets/specie_card.dart';


const String SCREEN_TITLE = "List of Species";

class LoadedList extends StatelessWidget {
  const LoadedList({
    Key? key,
    required this.specieList,
  }) : super(key: key);

  final List<Specie> specieList;

  @override
  Widget build(BuildContext context) {
    return SpecieListPage(specieList: specieList);
  }
}

class SpecieListPage extends StatefulWidget {
  const SpecieListPage({
    Key? key,
    required this.specieList,
  }) : super(key: key);

  final List<Specie> specieList;

  @override
  State createState() {
    return SpecieListPageState();
  }
}

class SpecieListPageState extends State<SpecieListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildStatusPage(widget.specieList, context);
  }

  StatelessWidget _buildStatusPage(List<Specie> specieList, BuildContext context) {
    return _buildExpandableTheme(specieList, context);
  }

  ExpandableTheme _buildExpandableTheme(List<Specie> specieList, BuildContext context) {
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
            for (var specie in specieList) SpecieCard(specie),
          ],
        ),
      ),
    );
  }
}
