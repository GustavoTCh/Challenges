import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import 'package:shopping_car/domain/products/i_product_repository.dart';
import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/domain/products/product_failure.dart';
import 'package:shopping_car/infrastructure/core/firestore_helpers.dart';
import 'package:shopping_car/infrastructure/product/product_dtos.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository(this._firestore);

  @override
  Stream<Either<ProductFailure, KtList<Product>>> getAllData() async* {
    final productsDocs = _firestore.getAllProduct();
    yield* productsDocs.snapshots().map((snapshot) {
      final products = right<ProductFailure, KtList<Product>>(
        snapshot.docs
            .map(
              (doc) => ProductDto.fromFirestore(doc).toDomain(),
            )
            .toImmutableList(),
      );
      products.fold(
        (l) => null,
        (r) => log('Firestore data path: /${productsDocs.path} with data ${r.size} ${r.toString()}'),
      );
      return products;
    }).onErrorReturnWith(
      (e) {
        if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
          return left(const ProductFailure.insufficientPermission());
        } else {
          return left(const ProductFailure.unexpected());
        }
      },
    );
  }
}
