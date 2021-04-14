import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_car/domain/core/value_objects.dart';
import 'package:shopping_car/domain/products/product.dart';
import 'package:shopping_car/domain/products/value_objects.dart';

part 'product_dtos.freezed.dart';
part 'product_dtos.g.dart';

@freezed
abstract class ProductDto implements _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required int price,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _ProductDto;

  factory ProductDto.fromDomain(Product product) {
    return ProductDto(
      id: product.id.getOrCrash(),
      name: product.name.getOrCrash(),
      price: product.price.getOrCrash(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Product toDomain() {
    return Product(
      id: UniqueId.fromUniqueString(id),
      name: ProductName(name),
      price: ProductPrice(price),
    );
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  factory ProductDto.fromFirestore(DocumentSnapshot doc) {
    return ProductDto.fromJson(doc.data()).copyWith(id: doc.id);
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
