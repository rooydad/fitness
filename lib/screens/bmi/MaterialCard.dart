import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard( this.colour, this.cardChild,this.onpressed);

  final Color colour;
  final Widget cardChild;
  final VoidCallback onpressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onpressed;
      },
      child: Container(
        width: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
      ),
    );
  }
}