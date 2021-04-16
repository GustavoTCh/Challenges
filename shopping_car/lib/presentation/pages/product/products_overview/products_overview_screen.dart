import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/presentation/global_widgets/background.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/cubit/product_overview_cubit.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/product_body.dart';
import 'package:shopping_car/presentation/pages/product/products_overview/product_header.dart';

class ProductsOverViewScreen extends StatelessWidget {
  ProductsOverViewScreen({
    Key key,
    @required this.listProducts,
  })  : assert(listProducts != null),
        super(key: key);

  final KtList<Product> listProducts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductOverviewCubit>(
      create: (context) => ProductOverviewCubit(),
      child: Background(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 35,
                    ),
                    onPressed: () {},
                    tooltip: 'Shopping car',
                    splashRadius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
            leading: BackButton(),
          ),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                height: 100,
                child: ProductHeader(listProducts: listProducts),
              ),
              ProductBody(
                listProducts: listProducts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
