import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/connection_error.dart';
import 'package:starwars_clean_architecture/core/utils/components/progress.dart';
import 'package:starwars_clean_architecture/core/utils/components/unknown_error.dart';
import 'package:starwars_clean_architecture/features/drawer/presentation/drawer/my_drawer.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/bloc/bloc.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/bloc/planets_event.dart';
import 'package:starwars_clean_architecture/features/planets/presentation/widgets/loaded_list.dart';

import '../../../../injection_container.dart';

class PlanetList extends StatelessWidget {
  static const String SCREEN_TITLE = "List of Planets";

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeStarWarsAppNotifier>(
      builder: (context, theme, child) =>  MaterialApp(
        debugShowMaterialGrid: false,
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            actions: [
              IconButton(icon: (theme.getTheme() == theme.lightTheme)? Icon(Icons.nightlight_round):Icon(Icons.wb_sunny), onPressed: () => {theme.switchTheme()}),
            ],
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              SCREEN_TITLE,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: BlocProvider(
            create: (_) => sl<PlanetsBloc>()..add(GetPlanetsBlocEvent(1)),
            child: Center(
              child: Column(
                children: <Widget>[
                  // Top half
                  BlocBuilder<PlanetsBloc, PlanetsState>(
                    builder: (context, state) {
                      if (state is Empty) {
                        return SizedBox(
                          height: 1,
                        );
                      } else if (state is Loading) {
                        return Progress();
                      } else if (state is Loaded) {
                        return LoadedList(planetList: state.listOfPlanets,
                          isLightTheme: theme.isLightTheme(),);
                      } else if (state is Error) {
                        return ConnectionError();
                      } else {
                        return UnknownError();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
