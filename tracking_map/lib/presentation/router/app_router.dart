import 'package:flutter/material.dart';
import 'package:tracking_map/presentation/screens/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      default:
        return null;
    }
  }
}
