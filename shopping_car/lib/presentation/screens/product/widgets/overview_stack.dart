import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';

import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/presentation/global_widgets/image_container.dart';
import 'package:shopping_car/presentation/screens/product/product_detail_page.dart';
import 'package:shopping_car/presentation/screens/product/product_widget_bloc.dart';


const _duration = Duration(milliseconds: 300);

class OverviewStack extends StatefulWidget {
  OverviewStack({
    Key key,
    @required this.listProducts,
  })  : assert(listProducts != null),
        super(key: key);

  final KtList<Product> listProducts;

  @override
  _OverviewStackState createState() => _OverviewStackState();
}

class _OverviewStackState extends State<OverviewStack> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = ProductWidgetProvider.of(context).bloc;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: _ProductHeader(
              listProducts: widget.listProducts,
            ),
          ),
          ValueListenableBuilder<double>(
              valueListenable: bloc.currentPage,
              builder: (contextListener, currentPage, _) {
                return Transform.scale(
                  scale: 2,
                  alignment: Alignment.bottomCenter,
                  child: PageView.builder(
                    controller: bloc.pageOverviewController,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.listProducts.size + 1,
                    onPageChanged: (value) {
                      if (value < widget.listProducts.size) {
                        bloc.pageTextController
                            .animateToPage(value, duration: _duration, curve: Curves.easeOut);
                      }
                      if (value == widget.listProducts.size) {
                        bloc.pageOverviewController.animateToPage(
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
                      final product = widget.listProducts[index - 1];
                      final result = currentPage - index + 1;
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
                                    child: ProductDetailPage(
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
                );
              }),
        ],
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({Key key, @required this.listProducts})
      : assert(listProducts != null),
        super(key: key);

  final KtList<Product> listProducts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = ProductWidgetProvider.of(context).bloc;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (tweenContext, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -100 * value),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      child: ValueListenableBuilder<double>(
          valueListenable: bloc.textPage,
          builder: (contextListener, textPage, _) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: listProducts.size,
                    controller: bloc.pageTextController,
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
          }),
    );
  }
}
