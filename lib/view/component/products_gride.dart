// ignore_for_file: unused_import

import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/constant/route.dart';
import 'package:coffee/model/product_model.dart';
import 'package:coffee/view/component/btn_qty_addtocart.dart';
import 'package:coffee/view/pages/detail_page.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key, required this.eachProducts});
  final Products eachProducts;

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => nextScreen(
              context, DetailPage(eachProducts: widget.eachProducts)),
          child: Hero(
            tag: widget.eachProducts,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: widget.eachProducts.colors,
                borderRadius: BorderRadius.circular(20),
                image:
                    DecorationImage(image: AssetImage(widget.eachProducts.img)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
        //product name
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            widget.eachProducts.name,
            style: fontSearchMore,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //price
            Text(
              '\$ ${widget.eachProducts.price}',
              style: fontMenu,
            ),
            //btn add to cart
            GestureDetector(
              onTap: () => addProductToCart(context, widget.eachProducts),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: colorsItem,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey.shade500,
                      )
                    ]),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
