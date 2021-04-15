// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

// ignore: unused_element
  _Product call(
      {@required UniqueId id,
      @required ProductName name,
      @required ProductPrice price,
      @required UrlImage urlImage}) {
    return _Product(
      id: id,
      name: name,
      price: price,
      urlImage: urlImage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  UniqueId get id;
  ProductName get name;
  ProductPrice get price;
  UrlImage get urlImage;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id, ProductName name, ProductPrice price, UrlImage urlImage});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object urlImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as ProductName,
      price: price == freezed ? _value.price : price as ProductPrice,
      urlImage: urlImage == freezed ? _value.urlImage : urlImage as UrlImage,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id, ProductName name, ProductPrice price, UrlImage urlImage});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object price = freezed,
    Object urlImage = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as ProductName,
      price: price == freezed ? _value.price : price as ProductPrice,
      urlImage: urlImage == freezed ? _value.urlImage : urlImage as UrlImage,
    ));
  }
}

/// @nodoc
class _$_Product extends _Product {
  const _$_Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.urlImage})
      : assert(id != null),
        assert(name != null),
        assert(price != null),
        assert(urlImage != null),
        super._();

  @override
  final UniqueId id;
  @override
  final ProductName name;
  @override
  final ProductPrice price;
  @override
  final UrlImage urlImage;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, urlImage: $urlImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.urlImage, urlImage) ||
                const DeepCollectionEquality()
                    .equals(other.urlImage, urlImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(urlImage);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);
}

abstract class _Product extends Product {
  const _Product._() : super._();
  const factory _Product(
      {@required UniqueId id,
      @required ProductName name,
      @required ProductPrice price,
      @required UrlImage urlImage}) = _$_Product;

  @override
  UniqueId get id;
  @override
  ProductName get name;
  @override
  ProductPrice get price;
  @override
  UrlImage get urlImage;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith;
}
