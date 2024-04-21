import 'package:kstructure/src/screens/introduction/intro.dart';
import 'package:kstructure/src/screens/models/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:kstructure/src/screens/models/contents/contents_by_category.dart';
import 'package:kstructure/src/screens/models/contents/contents_by_id.dart';
import 'package:kstructure/src/screens/models/dashboard/dashboard.dart';
import 'package:kstructure/src/screens/models/profile/profile.dart';
import 'package:kstructure/src/utils/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:kstructure/src/screens/authentication/login.dart';
import 'package:kstructure/src/screens/authentication/registration.dart';
import 'package:kstructure/src/screens/splash/splash.dart';
import 'package:kstructure/src/widgets/app_play_video.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.intro: (context) => IntroScreen(),
  RouteNames.dashboard: (context) => dashboard(),
  RouteNames.profile: (context) => profile(),
  RouteNames.bottomNavigationBar: (context) => bottomNavigation(),
  RouteNames.getContentsByCategory: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return contentsByCategoryId(
      id: args?['content_id'],
      title: args?['title'],
    );
  },
  RouteNames.getContentsById: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return contentsById(
      id: args?['content_id'],
      title: args?['title'],
    );
  },
  RouteNames.videoPlayer: (context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return videoPlayer(
      id: args?['content_id'],
      title: args?['title'],
      url: args?['url'],
    );
  },
};
