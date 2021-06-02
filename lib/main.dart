import 'package:flutter/material.dart';

import 'core/theme/theme_manager.dart';
import 'features/dashboard/presentation/dashboard/dashboard.dart';
import 'injection_container.dart' as di;
import 'package:provider/provider.dart';

void main() async {
  await di.init();
  runApp(ChangeNotifierProvider<ThemeStarWarsAppNotifier>(
    create: (_) => new ThemeStarWarsAppNotifier(),
    child: StarWarsApp(),
  ));
}

class StarWarsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
