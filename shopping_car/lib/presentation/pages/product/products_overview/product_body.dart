import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/presentation/global_widgets/image_container.dart';
import 'package:shopping_car/presentation/pages/product/product_details/product_detail_screen.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/cubit/product_overview_cubit.dart';

final _duration = const Duration(milliseconds: 300);

class ProductBody extends StatelessWidget {
  const ProductBody({
    Key key,
    @required this.listProducts,
  }) : super(key: key);

  final KtList<Product> listProducts;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductOverviewCubit, ProductOverviewState>(
      builder: (blocContext, state) {
        final cubitProductOverView = blocContext.read<ProductOverviewCubit>();
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Transform.scale(
            scale: 2,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: cubitProductOverView.pageBodyController,
              scrollDirection: Axis.vertical,
              allowImplicitScrolling: true,
              itemCount: listProducts.size + 1,
              onPageChanged: (value) {
                if (value < listProducts.size) {
                  cubitProductOverView.pageTextController.animateToPage(
                    value,
                    duration: _duration,
                    curve: Curves.easeOut,
                  );
                }
                if (value == listProducts.size) {
                  cubitProductOverView.pageBodyController.animateToPage(
                    value - 1,
                    duration: _duration,
                    curve: Curves.easeOut,
                  );
                }
              },
              itemBuilder: (_, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }
                final product = listProducts[index - 1];
                final result = state.currentBodyPage - index + 1;
                final value = -0.3 * result + 1;
                final opacity = value.clamp(0.5, 1.0);
                return GestureDetector(
                  onTap: () {
                    if (result == 0) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 750),
                          pageBuilder: (routeContext, animation, _) {
                            return FadeTransition(
                              opacity: animation,
                              child: ProductDetailScreen(
                                product: product,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.04),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0)
                        ..translate(
                          0.0,
                          size.height / 1.2 * (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: product.id.getOrCrash(),
                          child: ImageContainer(
                            imageUrl: product.urlImage.getOrCrash(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
