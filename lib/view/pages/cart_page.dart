import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:coffee/model/product_model.dart';
import 'package:coffee/view/component/btn_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        //cart is not empty
        body: value.cart.isNotEmpty
            ? ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  var eachCart = value.cart[index];
                  return Card(
                    shadowColor: Colors.black,
                    child: ListTile(
                      //image
                      leading: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: eachCart.colors,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(eachCart.img),
                          ),
                        ),
                      ),
                      //product name
                      title: Text(
                        eachCart.name,
                        style: fontMenu,
                      ),
                      //price
                      subtitle: Text(
                        '\$ ${eachCart.price}',
                        style: fontCategory1,
                      ),
                      //icon btn delete
                      trailing: IconButton(
                        onPressed: () =>
                            removeProductFromCart(value.cart[index]),
                        icon: Icon(
                          Icons.highlight_remove,
                          size: 30,
                          color: colorsItem,
                        ),
                      ),
                    ),
                  );
                })

            //cart is empty
            : Center(
                child: Text(
                  'Prouduct is Empty!',
                  style: fontMenu,
                ),
              ),
        //btn nav pay ment
        bottomNavigationBar: const BtnOrder(),
      ),
    );
  }
}
