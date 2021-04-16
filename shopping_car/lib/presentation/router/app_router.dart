import 'package:flutter/material.dart';

import 'package:shopping_car/presentation/pages/home_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return null;
    }
  }
}
