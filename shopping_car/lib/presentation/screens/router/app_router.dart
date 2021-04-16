import 'package:flutter/material.dart';

import 'package:shopping_car/presentation/screens/product/product_conpect_home.dart';
import 'package:shopping_car/presentation/screens/product/product_widget_bloc.dart';


class AppRouter {
  final bloc = ProductWidgetBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => ProductWidgetProvider(
            bloc: bloc,
            child: MaterialApp(home: ProductHome()),
          ),
        );
      default:
        return null;
    }
  }
}
