import 'package:flutter/material.dart';
import 'package:shopping_car/presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key key,
    @required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}