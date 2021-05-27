import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/config/app_config.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/features/drawer/presentation/drawer/my_drawer.dart';
import 'package:starwars_clean_architecture/features/films/presentation/pages/film_list.dart';
import 'package:starwars_clean_architecture/features/people/presentation/pages/person_list.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/pages/planet_list.dart';
import 'package:starwars_clean_architecture/features/species/presentation/pages/specie_list.dart';
import 'package:starwars_clean_architecture/features/starships/presentation/pages/starship_list.dart';
import 'package:starwars_clean_architecture/features/vehicles/presentation/pages/vehicle_list.dart';

import 'components/dashboard_card.dart';

class Dashboard extends StatelessWidget {
  static const String SCREEN_TITLE = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStarWarsApp().darkTheme,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            SCREEN_TITLE,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(bottom: 10),
          child: ListView(
            children: [
              DashboardCard(
                "Movies",
                "List of all movies from Original and Prequel Trilogies",
                DASHBOARD_FIRSTCARD_FIRSTCOLOR,
                DASHBOARD_FIRSTCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/startitle.png",
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilmList()),
                 ),
              ),
              DashboardCard(
                "CHARACTERS",
                "List of all characters from Original and Prequel Trilogies",
                DASHBOARD_SECONDCARD_FIRSTCOLOR,
                DASHBOARD_SECONDCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/darth.png",
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonList()),
                ),
              ),
              DashboardCard(
                "Starships",
                "List of all starships from Original and Prequel Trilogies",
                DASHBOARD_THIRTHCARD_FIRSTCOLOR,
                DASHBOARD_THIRTHCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/stardeath.png",
                onClick: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StarshipList()),
                ),
              ),
              DashboardCard(
                "Vehicles",
                "List of all vehicles from Original and Prequel Trilogies",
                DASHBOARD_FOURTHCARD_FIRSTCOLOR,
                DASHBOARD_FOURTHCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/tie.png",
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleList()),
                ),
              ),
              DashboardCard(
                "Species",
                "List of all species from Original and Prequel Trilogies",
                DASHBOARD_FIFTHCARD_FIRSTCOLOR,
                DASHBOARD_FIFTHCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/yoda.png",
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpecieList()),
                ),
              ),
              DashboardCard(
                "Planets",
                "List of all planets from Original and Prequel Trilogies",
                DASHBOARD_SIXTHCARD_FIRSTCOLOR,
                DASHBOARD_SIXTHCARD_SECONDCOLOR,
                "${AppConfig.urlLocalPhotos}/dashboard/planet.png",
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanetList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
