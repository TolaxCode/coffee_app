import 'package:coffee/constant/colors.dart';
import 'package:coffee/constant/fonts.dart';
import 'package:coffee/constant/route.dart';
import 'package:coffee/model/cart_product.dart';
import 'package:coffee/view/component/toggle_categories.dart';
import 'package:coffee/view/component/title_search.dart';
import 'package:coffee/view/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//index of categoies
int currentCategories = 0;

//name of list categories
List categories = [
  'Americano',
  'Cuppucino',
  'Expresso',
  'Latte',
];

class _HomePageState extends State<HomePage> {
  //function
  void onChangeCategories(int index) {
    setState(() {
      currentCategories = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProducts>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorsItem,
          //icons menu
          leading: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          //icon btn shopping bag
          actions: [
            // cart is empty
            value.cart.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(right: 20, top: 18),
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
                    padding: const EdgeInsets.only(right: 20, top: 18),
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tile and search
            const TitleAndSearch(),
            //Categories
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20, left: 20),
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          onChangeCategories(index);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: currentCategories == index
                                ? Border(
                                    bottom: BorderSide(
                                      width: 2,
                                      color: colorsItem,
                                    ),
                                  )
                                : null,
                          ),
                          child: Text(
                            categories[index],
                            style: currentCategories == index
                                ? fontCategory
                                : fontCategory1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //list categories gride
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                //tog
                child: toggleCategories[currentCategories],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
