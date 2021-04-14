import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_car/domain/core/failures.dart';
import 'package:shopping_car/domain/core/value_objects.dart';
import 'package:shopping_car/domain/products/value_objects.dart';

part 'product.freezed.dart';

@freezed
abstract class Product implements _$Product {
  const Product._();

  const factory Product({
    @required UniqueId id,
    @required ProductName name,
    @required ProductPrice price,
  }) = _Product;

  factory Product.empty() => Product(
        id: UniqueId(),
        name: ProductName('not name'),
        price: ProductPrice(0),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(
          name.failureOrUnit,
        )
        .fold((f) => some(f), (_) => none());
  }
}
