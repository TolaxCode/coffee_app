import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';

import 'package:flutter/material.dart';

class TitleAndSearch extends StatefulWidget {
  const TitleAndSearch({super.key});

  @override
  State<TitleAndSearch> createState() => _TitleAndSearchState();
}

class _TitleAndSearchState extends State<TitleAndSearch> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.fromDateTime(now);
    String greeting;
    if (currentTime.hour < 12) {
      greeting = 'Good Morning';
    } else if (currentTime.hour < 18) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    return Stack(
      children: [
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorsItem,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            '$greeting!',
            style: fontTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 1,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                  hintText: 'Would do you want...?',
                  hintStyle: fontSearchMore,
                  // filled: true,
                  // fillColor: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
