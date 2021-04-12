import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  const ButtonCalculator({
    Key key,
    @required this.text,
    @required this.onPress,
    this.isTwiceWith = false,
    this.color,
  }) : super(key: key);

  final String text;
  final bool isTwiceWith;
  final Function onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: (MediaQuery.of(context).size.width - 100) / 4,
        width: (MediaQuery.of(context).size.width - 100) / (isTwiceWith ? 2 : 4),
        decoration: BoxDecoration(
          color: color ?? Colors.grey[900],
          borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.width - 60) / 4)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
