import 'package:coffee_challenge/bacground.dart';
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
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        isDark: isDark,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        scrollDirection: Axis.vertical,
                        autoPlay: false,
                        viewportFraction: 0.5
                      ),
                      items: [
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/1.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/2.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/3.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/4.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/5.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/6.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/7.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/8.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/9.png',fit: BoxFit.fill,)),
                        Container(height: 400, color: Colors.green, child: Image.asset('assets/images/10.png',fit: BoxFit.fill,)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
