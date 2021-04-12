import 'package:flutter/material.dart';
import 'package:test_programing/presentation/widget/button_calculator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final TextStyle style = TextStyle(color: Colors.white,fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _text(),
            ),
            _buttonsCalculator(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('1000',style: style,),
        Text('X',style: style,),
        Text('1000',style: style,),
        Divider(color: Colors.grey,height: 30,thickness: 2,),
        Text('10000000',style: style.copyWith(fontSize: 40),),
      ],
    );
  }

  Widget _buttonsCalculator() {
    return Column(
      children: [
        _rowButton(
          children: [
            ButtonCalculator(text: 'AC', color: Colors.grey, onPress: () {}),
            ButtonCalculator(text: '+/-', color: Colors.grey, onPress: () {}),
            ButtonCalculator(text: 'del', color: Colors.grey, onPress: () {}),
            ButtonCalculator(text: '/', color: Colors.orange, onPress: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _rowButton(
          children: [
            ButtonCalculator(text: '7', onPress: () {}),
            ButtonCalculator(text: '8', onPress: () {}),
            ButtonCalculator(text: '9', onPress: () {}),
            ButtonCalculator(text: 'X', color: Colors.orange, onPress: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _rowButton(
          children: [
            ButtonCalculator(text: '4', onPress: () {}),
            ButtonCalculator(text: '5', onPress: () {}),
            ButtonCalculator(text: '6', onPress: () {}),
            ButtonCalculator(text: '-', color: Colors.orange, onPress: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _rowButton(
          children: [
            ButtonCalculator(text: '1', onPress: () {}),
            ButtonCalculator(text: '2', onPress: () {}),
            ButtonCalculator(text: '3', onPress: () {}),
            ButtonCalculator(text: '+', color: Colors.orange, onPress: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _rowButton(
          children: [
            ButtonCalculator(text: '0', isTwiceWith: true, onPress: () {}),
            ButtonCalculator(text: '.', onPress: () {}),
            ButtonCalculator(text: '=', color: Colors.orange, onPress: () {}),
          ],
        ),
      ],
    );
  }

  Widget _rowButton({@required List<Widget> children}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
