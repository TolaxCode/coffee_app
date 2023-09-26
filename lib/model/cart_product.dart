import 'package:coffee/model/product_model.dart';
import 'package:flutter/material.dart';

class CartProducts extends ChangeNotifier {
  final List<Products> _cart = [];
  //get cart products
  List<Products> get cart => _cart;

  int qty = 1;
  //add productlist to cart
  void addToCart(Products products) {
    for (int i = 0; i < qty; i++) {
      _cart.add(products);
    }
    notifyListeners();
  }

  // remove products from cart
  void removeFromCart(Products products) {
    _cart.remove(products);
    notifyListeners();
  }

  //caculator price
  totalPrice() {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += _cart[i].price;
    }
    notifyListeners();
    return total;
  }

  //add Quality
  int addQty() {
    qty++;
    notifyListeners();
    return qty;
  }

  //remove Quality
  int removeQty() {
    qty > 1 ? qty-- : null;
    notifyListeners();
    return qty;
  }

  
}
