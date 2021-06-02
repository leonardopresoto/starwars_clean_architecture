import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/features/dashboard/presentation/dashboard/dashboard.dart';
import 'package:starwars_clean_architecture/features/films/presentation/pages/film_list.dart';
import 'package:starwars_clean_architecture/features/people/presentation/pages/person_list.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/pages/planet_list.dart';
import 'package:starwars_clean_architecture/features/species/presentation/pages/specie_list.dart';
import 'package:starwars_clean_architecture/features/starships/presentation/pages/starship_list.dart';
import 'package:starwars_clean_architecture/features/vehicles/presentation/pages/vehicle_list.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: YELLOW_STARWARS
            ),
            child: Center(child: Image.asset("assets/dashboard/startitle.png", fit: BoxFit.cover, width: 200,), ),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.description,
            redirectTo: Dashboard(),
          ),
          DrawerListTile(
            title: "Movies",
            redirectTo: FilmList(),
            icon: Icons.account_balance,
          ),
          DrawerListTile(
            title: "Characters",
            redirectTo: PersonList(),
            icon: Icons.people,
          ),
          DrawerListTile(
            title: "Starships",
            redirectTo: StarshipList(),
            icon: Icons.airplanemode_active,
          ),
          DrawerListTile(
            title: "Vehicles",
            redirectTo: VehicleList(),
            icon: Icons.directions_car,
          ),
          DrawerListTile(
            title: "Species",
            redirectTo: SpecieList(),
            icon: Icons.android_outlined,
          ),
          DrawerListTile(
            title: "Planets",
            redirectTo: PlanetList(),
            icon: Icons.place,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.redirectTo,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Widget redirectTo;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).accentIconTheme.color,),
      title: Text(
        title,
        style: TextStyle(color:Theme.of(context).accentIconTheme.color,fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => redirectTo),
        );
      },
    );
  }
}
