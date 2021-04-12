import 'package:flutter/material.dart';
import 'package:shopping_car/presentation/screens/home_screen.dart';
import 'package:shopping_car/presentation/screens/shopping_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/shopping':
        return MaterialPageRoute(
          builder: (_) => ShoppingScreen(),
        );
      default:
        return null;
    }
  }
}
