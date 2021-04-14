import 'package:flutter/material.dart';
import 'package:shopping_car/presentation/product/products_overview_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => ProductsOverviewPage(),
        );
      default:
        return null;
    }
  }
}
