import 'package:flutter/material.dart';


class ReusableColumn extends StatelessWidget {

  final IconData icon;
  final String text;
  ReusableColumn(this.icon,this.text);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'iransans',
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}