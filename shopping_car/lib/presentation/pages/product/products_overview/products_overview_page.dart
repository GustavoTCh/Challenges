import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/products_overview_screen.dart';

import '../widgets/critical_failure_display.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductWatcherBloc, ProductWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return ProductsOverViewScreen(
              listProducts: state.products,
            );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(
              failure: state.productFailure,
            );
          },
        );
      },
    );
  }
}
