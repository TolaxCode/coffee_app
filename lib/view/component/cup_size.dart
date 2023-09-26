import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupSize extends StatefulWidget {
  const CupSize({super.key});

  @override
  State<CupSize> createState() => _CupSizeState();
}

int? currentSize = 0;

List listSize = [
  'Small',
  'Medium',
  'Large',
];

class _CupSizeState extends State<CupSize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            'Cup Size',
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
              child: Text(listSize[0], style: fontTemperator),
            ),
            1: Container(
              alignment: Alignment.center,
              child: Text(listSize[1], style: fontTemperator),
            ),
            2: Container(
              alignment: Alignment.center,
              child: Text(listSize[2], style: fontTemperator),
            ),
          },
          groupValue: currentSize,
          onValueChanged: (value) {
            setState(() {
              currentSize = value;
            });
          },
        )
        // Row(
        //   children: List.generate(
        //     listSize.length,
        //     (index) {
        //       return Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(right: 20),
        //             child: GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   currentSize = index;
        //                 });
        //               },
        //               child: Container(
        //                 height: 60,
        //                 width: 60,
        //                 decoration: BoxDecoration(
        //                   color: currentSize == index
        //                       ? colorsItem
        //                       : Colors.grey.shade400,
        //                   shape: BoxShape.circle,
        //                   boxShadow: const [
        //                     BoxShadow(
        //                       blurRadius: 1,
        //                     )
        //                   ],
        //                   image: DecorationImage(
        //                     image: AssetImage(
        //                       listSize[index][0],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(right: 20),
        //             child: Text(
        //               listSize[index][1],
        //               style: currentSize == index ? fontSize1 : fontSize,
        //             ),
        //           )
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
