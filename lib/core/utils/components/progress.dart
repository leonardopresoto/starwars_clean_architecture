import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';

class Progress extends StatelessWidget {

  const Progress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeStarWarsAppNotifier>(
      builder: (context, theme, child) => Container(
        height: Utils().screenSafeAreaHeight(context) - 24,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Loading ...',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
