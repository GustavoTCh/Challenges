import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/cubit/product_overview_cubit.dart';

final _duration = const Duration(milliseconds: 300);

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    Key key,
    @required this.listProducts,
  }) : super(key: key);

  final KtList<Product> listProducts;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (tweenContext, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -100 * value),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: BlocBuilder<ProductOverviewCubit, ProductOverviewState>(
        builder: (blocContext, state) {
          final cubitProductOverView = blocContext.read<ProductOverviewCubit>();
          final textPage = state.currentBodyPage;
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: listProducts.size,
                  controller: cubitProductOverView.pageTextController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final opacity = (1 - (index - textPage).abs()).clamp(0.0, 1.0);
                    return Opacity(
                      opacity: opacity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                        child: Hero(
                          tag: 'name_${listProducts[index].id.getOrCrash()}',
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                '${listProducts[index].name.getOrCrash()}',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              AnimatedSwitcher(
                duration: _duration,
                child: Text(
                  '\$${listProducts[(listProducts.size > textPage.toInt()) ? textPage.toInt() : listProducts.size - 1].price.getOrCrash().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24),
                  key: Key(listProducts[(listProducts.size > textPage.toInt())
                          ? textPage.toInt()
                          : listProducts.size - 1]
                      .id
                      .getOrCrash()),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
