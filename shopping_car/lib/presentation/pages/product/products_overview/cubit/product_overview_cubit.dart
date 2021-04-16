import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'product_overview_state.dart';

const _initialPage = 8.0;

class ProductOverviewCubit extends Cubit<ProductOverviewState> {
  final pageBodyController = PageController(
    viewportFraction: 0.35,
    initialPage: _initialPage.toInt(),
  );
  final pageTextController = PageController(
    initialPage: _initialPage.toInt(),
  );

  ProductOverviewCubit()
      : super(
          ProductOverviewState(
            currentTitlePage: _initialPage,
            currentBodyPage: _initialPage,
          ),
        ) {
    pageBodyController.addListener(_productScrollListener);
  }

  void _productScrollListener() {
    emit(state.copyWith(currentBodyPage: pageBodyController.page));
  }

  @override
  Future<void> close() {
    pageBodyController.removeListener(_productScrollListener);
    pageBodyController.dispose();
    pageTextController.dispose();
    return super.close();
  }
}
