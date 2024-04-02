import 'package:flutter/material.dart';
import 'package:my_gallery/auth/presentation/screens/login/login_view.dart';
import 'package:my_gallery/home/presentation/screens/home/home_view.dart';
import 'app_strings.dart';

class Routes {
  static const String loginRoute = "/";
  static const String homeScreenRoute = "/homeScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeView());
      case Routes.homeScreenRoute:
      return MaterialPageRoute(builder: (_) =>  const HomeView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.wrongScreen),
        ),
        body: const Center(child: Text(AppStrings.routeNotFound)),
      ),
    );
  }
}
