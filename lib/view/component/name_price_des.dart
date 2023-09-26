// ignore_for_file: must_be_immutable

import 'package:coffee/constant/fonts.dart';
import 'package:coffee/model/product_model.dart';
import 'package:flutter/material.dart';

class NamePriceAndDes extends StatelessWidget {
  Products eachProducts;
  NamePriceAndDes({super.key, required this.eachProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              eachProducts.name,
              style: fontMenu,
            ),
            //price
            Text(
              '\$${eachProducts.price}',
              style: fontPrice,
            )
          ],
        ),
        //description
        Text(
          eachProducts.desc,
          style: fontSearchMore,
        ),
      ],
    );
  }
}
