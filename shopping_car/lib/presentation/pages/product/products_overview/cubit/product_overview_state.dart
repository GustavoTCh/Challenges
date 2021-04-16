part of 'product_overview_cubit.dart';

class ProductOverviewState extends Equatable {
  final double currentTitlePage;
  final double currentBodyPage;

  const ProductOverviewState({
    @required this.currentTitlePage,
    @required this.currentBodyPage,
  });

  @override
  List<Object> get props => [currentTitlePage,currentBodyPage];

  ProductOverviewState copyWith({
    double currentTitlePage,
    double currentBodyPage,
  }) {
    return ProductOverviewState(
      currentTitlePage: currentTitlePage ?? this.currentTitlePage,
      currentBodyPage: currentBodyPage ?? this.currentBodyPage,
    );
  }

  @override
  String toString() =>
      'ProductOverviewState(currentTitlePage: $currentTitlePage, currentBodyPage: $currentBodyPage)';
}
