import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.child,
    this.isDark = false,
  }) : super(key: key);

  final Widget child;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Positioned(
            // top: 0,
            left: 0,
            bottom: isDark?0:-150,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: isDark
                      ? LinearGradient(
                          colors: <Color>[
                            Colors.brown[700],
                            Color(0xffaf967d),
                            Colors.white,
                          ],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          stops: <double>[0.001, 0.25, 0.75],
                        )
                      : RadialGradient(
                          center: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.brown[700],
                            Color(0xffaf967d),
                            Colors.white,
                          ],
                          stops: <double>[0.105, 0.17, 0.3],
                          radius: 4,
                          // focalRadius: 10,
                        ),
                ),
              ),
            ),
            
          ),
          child,
        ],
      ),
    );
  }
}
