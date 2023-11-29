import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(CoinFlip());

class CoinFlip extends StatefulWidget { // ekane statelesswidget dile coinHead er value update hoi na
  @override
  State<CoinFlip> createState() => _CoinFlipState();
}

class _CoinFlipState extends State<CoinFlip> {
  int coinHead = 0;

  Random coinSide = new Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The coin is: '+(coinHead == 1 ? 'heads' : 'tails'),),),
          floatingActionButton:FloatingActionButton(
            child: Icon(Icons.attach_money),
            onPressed: (){
              setState((){
              coinHead = coinSide.nextInt(2);
              });
              
              print(coinHead);
          },)
        ),
      );
    
  }
}