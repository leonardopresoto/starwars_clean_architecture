import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/connection_error.dart';
import 'package:starwars_clean_architecture/core/utils/components/progress.dart';
import 'package:starwars_clean_architecture/core/utils/components/unknown_error.dart';
import 'package:starwars_clean_architecture/features/drawer/presentation/drawer/my_drawer.dart';
import 'package:starwars_clean_architecture/features/people/presentation/bloc/bloc.dart';
import 'package:starwars_clean_architecture/features/people/presentation/widgets/loaded_list.dart';

import '../../../../injection_container.dart';

class PersonList extends StatelessWidget {
  static const String SCREEN_TITLE = "List of Characters";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          create: (_) => sl<PeopleBloc>()..add(GetPeopleBlocEvent(1)),
          child: Center(
            child: Column(
              children: <Widget>[
                // Top half
                BlocBuilder<PeopleBloc, PeopleState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return SizedBox(
                        height: 1,
                      );
                    } else if (state is Loading) {
                      return Progress();
                    } else if (state is Loaded) {
                      return LoadedList(
                          personList: state
                              .listOfPeople); // Text(state.listOfPeople[3].name);
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
