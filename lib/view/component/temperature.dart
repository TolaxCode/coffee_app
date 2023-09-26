import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

int? currentSelect = 0;
List<String> listTemperature =[
  'Ice',
  'Frap',
  'Hot'
];

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            'Temperature',
            style: fontMenu,
          ),
        ),
        CupertinoSlidingSegmentedControl(
          thumbColor: colorsItem,
          backgroundColor: Colors.grey.shade400,
          children: {
            0: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              child: Text(
                listTemperature[0],
                style: fontTemperator,
              ),
            ),
            1: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              child: Text(
                listTemperature[1],
                style: fontTemperator,
              ),
            ),
            2: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              child: Text(listTemperature[2], style: fontTemperator),
            ),
          },
          groupValue: currentSelect,
          onValueChanged: (value) {
            setState(() {
              currentSelect = value;
            });
          },
        ),
      ],
    );
  }
}
