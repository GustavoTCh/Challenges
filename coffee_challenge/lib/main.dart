import 'package:coffee_challenge/bacground.dart';
import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Coffee challenge',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageCoffeeController = PageController(viewportFraction: 0.35);
  double _currentPage = 0.0;

  void _coffeeScrollListener() {}

  @override
  void initState() {
    _pageCoffeeController.addListener(_coffeeScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeeController.removeListener(_coffeeScrollListener);
    _pageCoffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.red,
            ),
          ),
          PageView.builder(
            controller: _pageCoffeeController,
            scrollDirection: Axis.vertical,
            itemCount: coffees.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox.shrink();
              }
              final coffee = coffees[index - 1];
              final result = _currentPage - index + 1;
              final value = -0.4 * result + 1;
              final opacity = value.clamp(0.0, 1.0);
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                    0.0,
                    MediaQuery.of(context).size.height / 2.6 * (1 - value).abs(),
                  )
                  ..scale(value),
                child: Opacity(
                  opacity: opacity,
                  child: Image.asset(coffee.image),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
