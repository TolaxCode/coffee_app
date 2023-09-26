import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';

import 'package:flutter/material.dart';

class SugarLevel extends StatefulWidget {
  const SugarLevel({super.key});

  @override
  State<SugarLevel> createState() => _SugarLevelState();
}

double _currentValue = 0;

class _SugarLevelState extends State<SugarLevel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sugar Level',
            style: fontMenu,
          ),
          Slider(
            inactiveColor: Colors.black,
            value: _currentValue,
            thumbColor: colorsItem,
            activeColor: colorsItem,
            min: 0,
            max: 100,
            label: '$_currentValue',
            divisions: 10,
            secondaryTrackValue: 100,
            secondaryActiveColor: Colors.grey,
            allowedInteraction: SliderInteraction.tapAndSlide,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
