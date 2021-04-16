import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/presentation/screens/product/product_conpect_home.dart';
import 'package:shopping_car/presentation/screens/product/product_widget_bloc.dart';
import 'package:shopping_car/presentation/screens/router/app_router.dart';

import '../../injection.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key key,
    @required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductWatcherBloc>(
          create: (context) =>
              getIt<ProductWatcherBloc>()..add(const ProductWatcherEvent.watchAllStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.brown),
        onGenerateRoute: appRouter.onGenerateRoute,
        home: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final bloc = ProductWidgetBloc();
  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ProductWidgetProvider(
            bloc: bloc,
            child: MaterialApp(home: ProductHome()),
          );
  }
}