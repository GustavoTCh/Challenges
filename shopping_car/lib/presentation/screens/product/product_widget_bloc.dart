import 'package:flutter/material.dart';

const _initialPage = 8.0;

class ProductWidgetBloc {
  final pageOverviewController = PageController(
    viewportFraction: 0.35,
    initialPage: _initialPage.toInt(),
  );
  final pageTextController = PageController(
    initialPage: _initialPage.toInt(),
  );
  final currentPage = ValueNotifier<double>(_initialPage);
  final textPage = ValueNotifier<double>(_initialPage);

  void init() {
    pageOverviewController.addListener(_productScrollListener);
    pageTextController.addListener(_textScrollListener);
  }

  void _productScrollListener() {
    currentPage.value = pageOverviewController.page;
  }

  void _textScrollListener() {
    textPage.value = pageTextController.page;
  }

  void dispose() {
    pageOverviewController.removeListener(_productScrollListener);
    pageTextController.removeListener(_textScrollListener);
    pageOverviewController.dispose();
    pageTextController.dispose();
  }
}

class ProductWidgetProvider extends InheritedWidget {
  final ProductWidgetBloc bloc;

  ProductWidgetProvider({@required this.bloc, Widget child}) : super(child: child);

  static ProductWidgetProvider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ProductWidgetProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
