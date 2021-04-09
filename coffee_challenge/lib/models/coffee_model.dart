import 'dart:math';

import 'package:meta/meta.dart';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;

final random = Random();
final coffees = List.generate(
  _names.length-1,
  (index) => CoffeeModel(
    name: _names[index +1],
    image: 'assets/images/${index + 1}.png',
    price: _doubleInRange(random, 3, 7),
  ),
);

class CoffeeModel {
  final String name;
  final String image;
  final double price;

  CoffeeModel({
    @required this.name,
    @required this.image,
    @required this.price,
  });
}


final _names = [
  "Caramel Macchiato",
  "Caramel Cold Drink",
  "Iced Coffe Mocha",
  "Caramelized Pecan Latte",
  "Toffee Nut Latte",
  "Capuchino",
  "Toffee Nut Iced Latte",
  "Americano",
  "Vietnamese-Style Iced Coffee",
  "Black Tea Latte",
  "Classic Irish Coffee",
  "Toffee Nut Crunch Latte",
];