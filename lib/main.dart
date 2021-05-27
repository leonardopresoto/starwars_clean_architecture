import 'package:flutter/material.dart';

import 'features/dashboard/presentation/dashboard/dashboard.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(StarWarsApp());
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
