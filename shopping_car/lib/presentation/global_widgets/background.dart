import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              bottom: -150,
              right: 0,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.brown[700],
                        Color(0xffaf967d),
                        Colors.white,
                      ],
                      stops: <double>[0.105, 0.17, 0.3],
                      radius: 4,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xffaf967d),
                      Colors.white,
                    ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    stops: <double>[ 0.01, 0.4],
                  )),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
