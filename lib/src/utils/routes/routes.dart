import 'package:kstructure/src/screens/introduction/intro.dart';
import 'package:kstructure/src/screens/models/client/bottomNavigationBar/bottomNavigationBar.dart';
// import 'package:kstructure/src/screens/models/client/buses/bookBus.dart';
// import 'package:kstructure/src/screens/models/client/buses/buses.dart';
// import 'package:kstructure/src/screens/models/client/buses/exploreBuses.dart';
import 'package:kstructure/src/screens/models/client/dashboard/dashboard.dart';
import 'package:kstructure/src/screens/models/client/navigation/navigation.dart';
import 'package:kstructure/src/screens/models/client/pricing/pricing.dart';
import 'package:kstructure/src/screens/models/client/profile/profile.dart';
import 'package:kstructure/src/screens/models/client/rides/rides.dart';
import 'package:kstructure/src/screens/models/client/searchBus/searchBus.dart';
import 'package:kstructure/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:kstructure/src/screens/authentication/login.dart';
import 'package:kstructure/src/screens/authentication/registration.dart';
import 'package:kstructure/src/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.intro: (context) => IntroScreen(),
  RouteNames.dashboard: (context) => dashboard(),
  RouteNames.rides: (context) => rides(),
  RouteNames.profile: (context) => profile(),
  RouteNames.bottomNavigationBar: (context) => bottomNavigation(),
  RouteNames.navigation: (context) => navigation(),
  RouteNames.pricing: (context) => pricing(),
  // RouteNames.buses: (context) {
  //   final Map<String, dynamic>? args =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   return buses(
  //     destination: args?['destination'],
  //     dire: args?['dire'],
  //     route: args?['route'],
  //   );
  // },
  // RouteNames.exploreBuses: (context) {
  //   final Map<String, dynamic>? args =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   return exploreBuses(
  //     id: args?['id'],
  //     busNumber: args?['busNumber'],
  //   );
  // },
  // RouteNames.bookBus: (context) {
  //   final Map<String, dynamic>? args =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   return bookBus(
  //     id: args?['id'],
  //     seats: args?['seats'],
  //   );
  // },
};
