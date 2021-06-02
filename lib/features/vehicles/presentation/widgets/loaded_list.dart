import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';
import 'package:starwars_clean_architecture/features/vehicles/presentation/widgets/vehicle_card.dart';


const String SCREEN_TITLE = "List of Vehicles";

class LoadedList extends StatelessWidget {
  const LoadedList({
    Key? key,
    required this.vehicleList,
  }) : super(key: key);

  final List<Vehicle> vehicleList;

  @override
  Widget build(BuildContext context) {
    return VehicleListPage(vehicleList: vehicleList);
  }
}

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({
    Key? key,
    required this.vehicleList,
  }) : super(key: key);

  final List<Vehicle> vehicleList;

  @override
  State createState() {
    return VehicleListPageState();
  }
}

class VehicleListPageState extends State<VehicleListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildStatusPage(widget.vehicleList);
  }

  StatelessWidget _buildStatusPage(List<Vehicle> vehicleList) {
    return _buildExpandableTheme(vehicleList);
  }

  ExpandableTheme _buildExpandableTheme(List<Vehicle> vehicleList) {
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
            for (var vehicle in vehicleList) VehicleCard(vehicle),
          ],
        ),
      ),
    );
  }
}
