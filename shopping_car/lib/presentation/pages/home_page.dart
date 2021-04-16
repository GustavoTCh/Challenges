import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_car/application/products/product_watcher/bloc/product_watcher_bloc.dart';
import 'package:shopping_car/presentation/global_widgets/image_container.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/products_overview_screen.dart';
import 'package:shopping_car/presentation/pages/product/widgets/critical_failure_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ProductWatcherBloc, ProductWatcherState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loadSuccess: (state) {
              final products = state.products;
              return GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta < -20) {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 650),
                        pageBuilder: (routeContext, animation, _) {
                          return FadeTransition(
                            opacity: animation,
                            child: ProductsOverViewScreen(
                              listProducts: products,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFA89276), Colors.white])),
                      ),
                    ),
                    Positioned(
                      height: size.height * 0.3,
                      left: 0,
                      right: 0,
                      top: size.height * 0.12,
                      child: Hero(
                        tag: products[6].id.getOrCrash(),
                        child: ImageContainer(
                          imageUrl: products[5].urlImage.getOrCrash(),
                        ),
                      ),
                    ),
                    Positioned(
                      height: size.height * 0.6,
                      left: 0,
                      right: 0,
                      top: size.height * 0.2,
                      child: Hero(
                        tag: products[7].id.getOrCrash(),
                        child: ImageContainer(
                          imageUrl: products[6].urlImage.getOrCrash(),
                        ),
                      ),
                    ),
                    Positioned(
                      height: size.height * 0.9,
                      left: 0,
                      right: 0,
                      bottom: -size.height * 0.3,
                      child: Hero(
                        tag: products[8].id.getOrCrash(),
                        child: ImageContainer(
                          imageUrl: products[7].urlImage.getOrCrash(),
                        ),
                      ),
                    ),
                    Positioned(
                      height: size.height * 1.5,
                      left: 0,
                      right: 0,
                      bottom: -size.height * 1.35,
                      child: Hero(
                        tag: products[9].id.getOrCrash(),
                        child: ImageContainer(
                          imageUrl: products[8].urlImage.getOrCrash(),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 140,
                      left: 0,
                      right: 0,
                      bottom: size.height * 0.16,
                      child: Image.asset('assets/image/logo.png'),
                    )
                  ],
                ),
              );
            },
            loadFailure: (state) {
              return CriticalFailureDisplay(
                failure: state.productFailure,
              );
            },
          );
        },
      ),
    );
  }
}
