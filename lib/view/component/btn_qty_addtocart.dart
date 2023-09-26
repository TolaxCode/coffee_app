// ignore_for_file: must_be_immutable

import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:coffee/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtnQtyAddToCart extends StatefulWidget {
  Products eachProducts;
  BtnQtyAddToCart({super.key, required this.eachProducts});
  @override
  State<BtnQtyAddToCart> createState() => _BtnQtyAddToCartState();
}

// // add product to cart
void addProductToCart(BuildContext context, Products eachProducts) {
  Provider.of<CartProducts>(context, listen: false).addToCart(eachProducts);

  //alert dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: colorBackground,
      content: Text(
        "Added Sucessfully!",
        style: fontMenu,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Done',
            style: fontCategory,
          ),
        ),
      ],
    ),
  );
}

class _BtnQtyAddToCartState extends State<BtnQtyAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProducts>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //btn remove qty
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => value.removeQty(),
                        icon: const Icon(
                          Icons.remove,
                          size: 30,
                        ),
                      ),
                      Text(
                        value.qty.toString(),
                        style: fontPrice,
                      ),
                      IconButton(
                        onPressed: () => value.addQty(),
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),

                //btn add to cart
                InkWell(
                  onTap: () => addProductToCart(context, widget.eachProducts),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorsItem,
                    ),
                    child: Text(
                      'Add To Cart',
                      style: fontTemperator,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
