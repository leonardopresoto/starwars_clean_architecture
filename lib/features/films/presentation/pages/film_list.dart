import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/connection_error.dart';
import 'package:starwars_clean_architecture/core/utils/components/progress.dart';
import 'package:starwars_clean_architecture/core/utils/components/unknown_error.dart';
import 'package:starwars_clean_architecture/features/drawer/presentation/drawer/my_drawer.dart';
import 'package:starwars_clean_architecture/features/films/presentation/bloc/films_event.dart';
import 'package:starwars_clean_architecture/features/films/presentation/bloc/bloc.dart';
import 'package:starwars_clean_architecture/features/films/presentation/widgets/loaded_list.dart';

import '../../../../injection_container.dart';

class FilmList extends StatelessWidget {
  static const String SCREEN_TITLE = "List of Films";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeStarWarsApp().darkTheme,
      debugShowCheckedModeBanner: false,
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
          create: (_) => sl<FilmsBloc>()..add(GetFilmsBlocEvent(1)),
          child: Center(
            child: Column(
              children: <Widget>[
                // Top half
                BlocBuilder<FilmsBloc, FilmsState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return SizedBox(
                        height: 1,
                      );
                    } else if (state is Loading) {
                      return Progress();
                    } else if (state is Loaded) {
                      return LoadedList(
                          filmList: state
                              .listOfFilms);
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
