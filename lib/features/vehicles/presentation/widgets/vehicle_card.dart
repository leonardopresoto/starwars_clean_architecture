import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';


class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCard(this.vehicle);

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
                      vehicle.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildDataRow("Model : ", vehicle.model),
                    _buildDataRow("Manufacturer : ", vehicle.manufacturer),
                    _buildDataRow("Cost in credits : ", vehicle.costInCredits),
                    _buildDataRow("Lenght : ", vehicle.length),
                    _buildDataRow("Max Atmosphering Speed : ",
                        vehicle.maxAtmospheringSpeed),
                    _buildDataRow("Crew : ", vehicle.crew),
                    _buildDataRow("Passengers : ", vehicle.passengers),
                    _buildDataRow("Cargo Capacity : ", vehicle.cargoCapacity),
                    _buildDataRow("Consumables : ", vehicle.consumables),
                    _buildDataRow("Vehicle Class : ", vehicle.vehicleClass),
                    _buildDataRow("Pilots : ", Utils().prepareLists(vehicle.pilots)),
                    _buildDataRow("Films : ", Utils().prepareLists(vehicle.films)),
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
