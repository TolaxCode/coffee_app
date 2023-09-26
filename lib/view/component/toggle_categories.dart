import 'package:coffee/model/product_model.dart';
import 'package:coffee/view/component/products_gride.dart';
import 'package:flutter/material.dart';

List<Widget> toggleCategories = [
  //Americano
  GridView.builder(
    itemCount: americano.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.645,
    ),
    itemBuilder: (context, index) {
      var eachAmericano = americano[index];
      return ProductsGrid(eachProducts: eachAmericano);
    },
  ),
  //Cuppucino
  GridView.builder(
    itemCount: cuppuccino.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.645,
    ),
    itemBuilder: (context, index) {
      var eachCuppuccino = cuppuccino[index];
      return ProductsGrid(eachProducts: eachCuppuccino);
    },
  ),
  //Expresso
  GridView.builder(
    itemCount: expresso.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.645,
    ),
    itemBuilder: (context, index) {
      var eachExpresso = expresso[index];
      return ProductsGrid(eachProducts: eachExpresso);
    },
  ),
  //Latte
  GridView.builder(
    itemCount: latte.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.645,
    ),
    itemBuilder: (context, index) {
      var eachLatte = latte[index];
      return ProductsGrid(eachProducts: eachLatte);
    },
  ),
];
