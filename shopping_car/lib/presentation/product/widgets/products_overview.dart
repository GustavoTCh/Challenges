import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/presentation/product/widgets/product_card.dart';

import 'critical_failure_display.dart';
import 'error_note_card.dart';

class ProductsOverview extends StatelessWidget {
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
            return ListView.builder(
              itemBuilder: (context, index) {
                final product = state.products[index];
                if (product.failureOption.isSome()) {
                  return ErrorNoteCard(product: product);
                } else {
                  return ProductCard(product: product);
                }
              },
              itemCount: state.products.size,
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
