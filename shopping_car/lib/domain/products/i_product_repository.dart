

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/domain/products/product_failure.dart';

abstract class IProductRepository {
  Stream<Either<ProductFailure,KtList<Product>>> getAllData();
}