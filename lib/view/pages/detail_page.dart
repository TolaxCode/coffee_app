// ignore_for_file: must_be_immutable

import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/constant/route.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:coffee/model/product_model.dart';
import 'package:coffee/view/component/btn_qty_addtocart.dart';
import 'package:coffee/view/component/cup_size.dart';
import 'package:coffee/view/component/name_price_des.dart';
import 'package:coffee/view/component/sugar_level.dart';
import 'package:coffee/view/component/temperature.dart';
import 'package:coffee/view/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  Products eachProducts;
  DetailPage({super.key, required this.eachProducts});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 5))
        ..repeat(reverse: true, period: const Duration(seconds: 2));
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProducts>(
      builder: (context, value, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              //icons btn shopping
              actions: [
                //cart is empty
                value.cart.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () => nextScreen(context, const CartPage()),
                          child: const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    //cart is not empty
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, top: 15),
                        child: Badge(
                          label: Text(value.cart.length.toString()),
                          child: GestureDetector(
                            onTap: () => nextScreen(context, const CartPage()),
                            child: const Icon(
                              Icons.shopping_cart_checkout_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ],
              //btn back
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              //title
              title: Text(
                'Product Detail',
                style: fontTitle,
              ),
              centerTitle: true,
              backgroundColor: widget.eachProducts.colors,
              expandedHeight: 1200,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    //img products
                    Hero(
                      tag: widget.eachProducts,
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: widget.eachProducts.colors,
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          child: Image.asset(widget.eachProducts.img),
                          builder: (context, child) => Transform.rotate(
                            angle: _animationController.value,
                            alignment: Alignment.centerRight,
                            child: child,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorBackground,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //name price description
                              NamePriceAndDes(
                                eachProducts: widget.eachProducts,
                              ),
                              //Temperature
                              const Temperature(),
                              //sugar level
                              const SugarLevel(),
                              //item size
                              const CupSize(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //btn nav qty and add to cart
        bottomNavigationBar: BtnQtyAddToCart(
          eachProducts: widget.eachProducts,
        ),
      ),
    );
  }
}
