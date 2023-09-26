import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtnOrder extends StatelessWidget {
  const BtnOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProducts>(
      builder: (context, value, child) => Container(
        height: 260,
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 5,
                ),
                //title
                child: Text(
                  'Order Summary',
                  style: fontMenu,
                ),
              ),
              //total price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price ',
                      style: fontCategory1,
                    ),
                    Text(
                      '\$ ${value.totalPrice()}',
                      style: fontMenu,
                    ),
                  ],
                ),
              ),
              //summary order
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Price',
                      style: fontCategory1,
                    ),
                    value.cart.isEmpty
                        ? Text(
                            '\$ 0.0',
                            style: fontMenu,
                          )
                        : Text(
                            '\$ 1.5',
                            style: fontMenu,
                          ),
                  ],
                ),
              ),
              const Divider(
                indent: 2,
                thickness: 2,
              ),
              //total payment
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // text total payment
                    Text(
                      'Total Payment',
                      style: fontMenu,
                    ),
                    value.cart.isEmpty
                        ? Text(
                            '\$ 0.0',
                            style: fontMenu,
                          )
                        : Text(
                            '\$ ${value.totalPrice() + 1.50}',
                            style: fontMenu,
                          ),
                  ],
                ),
              ),
              //btn order
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorsItem,
                    ),
                    child: Text(
                      'Order Now',
                      style: fontTemperator,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
