import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';


class SpecieCard extends StatelessWidget {
  final Specie specie;

  SpecieCard(this.specie);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      specie.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildDataRow("Classification : ", specie.classification),
                    _buildDataRow("Designation : ", specie.designation),
                    _buildDataRow("Average Height : ", specie.averageHeight),
                    _buildDataRow("Skin Colors : ", specie.skinColors),
                    _buildDataRow("Hair Color : ",
                        specie.hairColors),
                    _buildDataRow("Eyes Colors : ", specie.eyeColors),
                    _buildDataRow("average_lifespan : ", specie.averageLifespan),
                    _buildDataRow("Homeworld : ", specie.homeworld),
                    _buildDataRow(
                        "Language : ", specie.language),
                    _buildDataRow("Characters : ", Utils().prepareLists(specie.people)),
                    _buildDataRow("Films : ", Utils().prepareLists(specie.films)),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                }, collapsed: null,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding _buildDataRow(String description, String data) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (description != null)? description:"-",
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              (data != null)? data:"n/a",
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}