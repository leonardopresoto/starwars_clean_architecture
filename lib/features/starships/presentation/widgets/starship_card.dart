import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';


class StarShipCard extends StatelessWidget {
  final Starship starship;

  StarShipCard(this.starship);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: Utils().screenSafeAreaWidth(context),
              height: 150,
              child: Container(
                child: Image.asset(
                  starship.image,
                  //fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Utils().randomColor(),
                      Utils().randomColor()
                    ])),
              ),
            ),
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
                      starship.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                collapsed: null,
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildDataRow("Model : ", starship.model),
                    _buildDataRow("Manufacturer : ", starship.manufacturer),
                    _buildDataRow("Cost in credits : ", starship.costInCredits),
                    _buildDataRow("Lenght : ", starship.length),
                    _buildDataRow("Max Atmosphering Speed : ",
                        starship.maxAtmospheringSpeed),
                    _buildDataRow("Crew : ", starship.crew),
                    _buildDataRow("Passengers : ", starship.passengers),
                    _buildDataRow("Cargo Capacity : ", starship.cargoCapacity),
                    _buildDataRow("Consumables : ", starship.consumables),
                    _buildDataRow(
                        "Hyperdrive Rating : ", starship.hyperdriveRating),
                    _buildDataRow("MegaLight : ", starship.mglt),
                    _buildDataRow("Starship Class : ", starship.starshipClass),
                    _buildDataRow("Pilots : ", prepareLists(starship.pilots)),
                    _buildDataRow("Films : ", prepareLists(starship.films)),
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
                },
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
              (data != null)? data:"-",
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  String prepareLists(List<String> list) {
    String result = "";
    if (list.isNotEmpty) {
      for (var starship in list) {
        result = result +
            starship
                .toString()
                .split("/")[starship.toString().split("/").length - 2] +
            ",";
      }
      result = result.substring(0, (result.length) - 1).replaceAll(",", "\n");
    } else {
      result = " - ";
    }
    return result;
  }
}
