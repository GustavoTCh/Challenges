import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/presentation/router/app_router.dart';

import '../../injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
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
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
