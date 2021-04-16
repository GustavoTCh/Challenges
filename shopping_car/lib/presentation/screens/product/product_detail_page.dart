import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/presentation/global_widgets/image_container.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
              tag: 'name_${product.id.getOrCrash()}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  product.name.getOrCrash(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: product.id.getOrCrash(),
                    child: ImageContainer(imageUrl: product.urlImage.getOrCrash()),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (tweenContext, value, child) {
                      return Transform.translate(
                        offset: Offset(-100 * value, 150 * value),
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      '\$${product.price.getOrCrash().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            spreadRadius: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
