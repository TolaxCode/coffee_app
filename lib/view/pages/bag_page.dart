import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:coffee/model/product_model.dart';
import 'package:coffee/view/component/btn_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    //remove products
    void removeProductFromCart(Products eachProducts) {
      Provider.of<CartProducts>(context, listen: false)
          .removeFromCart(eachProducts);
    }

    return Consumer<CartProducts>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorsItem,
          centerTitle: true,
          title: Text(
            'My Cart',
            style: fontTitle,
          ),
        ),
        //cart is empty
        body: value.cart.isEmpty
            ? Center(
                child: Text(
                  'Prouduct is Empty!',
                  style: fontMenu,
                ),
              )
            //cart is not empty
            : ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    //image
                    leading: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: value.cart[index].colors,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(value.cart[index].img),
                        ),
                      ),
                    ),
                    //product name
                    title: Text(
                      value.cart[index].name,
                      style: fontMenu,
                    ),
                    //price
                    subtitle: Text(
                      '\$ ${value.cart[index].price}',
                      style: fontCategory1,
                    ),
                    //icon btn delete
                    trailing: IconButton(
                      onPressed: () => removeProductFromCart(value.cart[index]),
                      icon: Icon(
                        Icons.highlight_remove,
                        size: 30,
                        color: colorsItem,
                      ),
                    ),
                  ),
                ),
              ),
        //btn nav pay ment
        bottomNavigationBar: const BtnOrder(),
      ),
    );
  }
}
