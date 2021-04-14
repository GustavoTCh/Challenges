import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/injection.dart';
import 'package:shopping_car/presentation/product/widgets/products_overview.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductWatcherBloc>(
          create: (context) =>
              getIt<ProductWatcherBloc>()..add(const ProductWatcherEvent.watchAllStarted()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          // leading: IconButton(
          //   icon: Icon(Icons.exit_to_app),
          //   onPressed: () {
          //     context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
          //   },
          // ),
          // actions: <Widget>[
          //   UncompletedSwitch(),
          // ],
        ),
        body: ProductsOverview(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
