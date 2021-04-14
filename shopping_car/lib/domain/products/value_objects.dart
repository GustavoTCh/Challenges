
import 'package:dartz/dartz.dart';
import 'package:shopping_car/domain/core/failures.dart';
import 'package:shopping_car/domain/core/value_objects.dart';
import 'package:shopping_car/domain/core/value_validators.dart';

class ProductPrice extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const maxLength = 1000;

  factory ProductPrice(int input) {
    assert(input != null);
    return ProductPrice._(
      validateNumberNoNegative(input),
    );
  }

  const ProductPrice._(this.value);
}

class ProductName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory ProductName(String input) {
    assert(input != null);
    return ProductName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const ProductName._(this.value);
}
