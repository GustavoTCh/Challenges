// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
class _$ProductDtoTearOff {
  const _$ProductDtoTearOff();

// ignore: unused_element
  _ProductDto call(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required String urlImage,
      @required double price,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp}) {
    return _ProductDto(
      id: id,
      name: name,
      urlImage: urlImage,
      price: price,
      serverTimeStamp: serverTimeStamp,
    );
  }

// ignore: unused_element
  ProductDto fromJson(Map<String, Object> json) {
    return ProductDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductDto = _$ProductDtoTearOff();

/// @nodoc
mixin _$ProductDto {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  String get urlImage;
  double get price;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ProductDtoCopyWith<ProductDto> get copyWith;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      String urlImage,
      double price,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res> implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  final ProductDto _value;
  // ignore: unused_field
  final $Res Function(ProductDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object urlImage = freezed,
    Object price = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      urlImage: urlImage == freezed ? _value.urlImage : urlImage as String,
      price: price == freezed ? _value.price : price as double,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(
          _ProductDto value, $Res Function(_ProductDto) then) =
      __$ProductDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      String urlImage,
      double price,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$ProductDtoCopyWithImpl<$Res> extends _$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(
      _ProductDto _value, $Res Function(_ProductDto) _then)
      : super(_value, (v) => _then(v as _ProductDto));

  @override
  _ProductDto get _value => super._value as _ProductDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object urlImage = freezed,
    Object price = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_ProductDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      urlImage: urlImage == freezed ? _value.urlImage : urlImage as String,
      price: price == freezed ? _value.price : price as double,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductDto extends _ProductDto {
  const _$_ProductDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required this.urlImage,
      @required this.price,
      @required @ServerTimestampConverter() this.serverTimeStamp})
      : assert(name != null),
        assert(urlImage != null),
        assert(price != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_ProductDto.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;
  @override
  final String urlImage;
  @override
  final double price;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'ProductDto(id: $id, name: $name, urlImage: $urlImage, price: $price, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.urlImage, urlImage) ||
                const DeepCollectionEquality()
                    .equals(other.urlImage, urlImage)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(urlImage) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

  @JsonKey(ignore: true)
  @override
  _$ProductDtoCopyWith<_ProductDto> get copyWith =>
      __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductDtoToJson(this);
  }
}

abstract class _ProductDto extends ProductDto {
  const _ProductDto._() : super._();
  const factory _ProductDto(
          {@JsonKey(ignore: true) String id,
          @required String name,
          @required String urlImage,
          @required double price,
          @required @ServerTimestampConverter() FieldValue serverTimeStamp}) =
      _$_ProductDto;

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$_ProductDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  String get urlImage;
  @override
  double get price;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$ProductDtoCopyWith<_ProductDto> get copyWith;
}
