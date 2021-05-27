import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/connection_error.dart';
import 'package:starwars_clean_architecture/core/utils/components/progress.dart';
import 'package:starwars_clean_architecture/core/utils/components/unknown_error.dart';
import 'package:starwars_clean_architecture/features/drawer/presentation/drawer/my_drawer.dart';
import 'package:starwars_clean_architecture/features/starships/presentation/bloc/starships_event.dart';
import 'package:starwars_clean_architecture/features/starships/presentation/bloc/bloc.dart';

import '../../../../injection_container.dart';

class StarshipList extends StatelessWidget {
  static const String SCREEN_TITLE = "List of Starships";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeStarWarsApp().darkTheme,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
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
          create: (_) => sl<StarshipsBloc>()..add(GetStarshipsBlocEvent(1)),
          child: Center(
            child: Column(
              children: <Widget>[
                // Top half
                BlocBuilder<StarshipsBloc, StarshipsState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return SizedBox(
                        height: 1,
                      );
                    } else if (state is Loading) {
                      return Progress();
                    } else if (state is Loaded) {
                      return Text("AQUIIII"); // Text(state.listOfStarships[3].name);
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
    );
  }
}
