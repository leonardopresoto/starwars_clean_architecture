// import 'package:flutter/material.dart';
// import 'package:starwars_clean_architecture/features/dashboard/presentation/dashboard/dashboard.dart';
//
//
//
// class AppRoutes {
//
//   static const splashScreen = "/splash";
//
//   static const dashboard = "/dashboard";
//   static const personList = "/person_list";
//   static const personDetail = "/person_detail";
//
//   static Route<dynamic> routes(RouteSettings settings) {
//     switch (settings.name) {
//       // case splashScreen:
//       //   return MaterialPageRoute(settings: RouteSettings(
//       //       name: settings.name, arguments: settings.arguments),
//       //       builder: (context) => Splash());
//       //   break;
//       case dashboard:
//         return MaterialPageRoute(settings: RouteSettings(
//             name: settings.name, arguments: settings.arguments),
//             builder: (context) => Dashboard());
//         break;
//       case personList:
//         return MaterialPageRoute(settings: RouteSettings(
//             name: settings.name, arguments: settings.arguments),
//             builder: (context) => PersonList());
//         break;
//       case personDetail:
//         return MaterialPageRoute(settings: RouteSettings(
//             name: settings.name, arguments: settings.arguments),
//             builder: (context) => PersonDetail(person: settings.arguments,));
//         break;
//     }
//   }
// }
