import 'package:fitnass/constants/constants.dart';
import 'package:flutter/material.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;

  const BuildOptions({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: blackColor.withOpacity(0.4),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'IranSans',
                  color: blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5.0),
              Icon(
                icon,
                color: blackColor.withOpacity(0.5),
                size: 23.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
