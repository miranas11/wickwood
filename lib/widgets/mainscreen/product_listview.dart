import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wickwood/components/product_data.dart';
import 'package:wickwood/widgets/cartscreen/cart_box.dart';
import 'package:wickwood/widgets/mainscreen/product_box.dart';

class ChairListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductBox(
            product: Provider.of<ProductData>(context).chairProducts[index],
            // name: Provider.of<ProductData>(context).chairProducts[index].name,
            // material:
            //     Provider.of<ProductData>(context).chairProducts[index].material,
            // price: Provider.of<ProductData>(context).chairProducts[index].price,
            // image: Provider.of<ProductData>(context).chairProducts[index].image,
            // categoryname:
            //     Provider.of<ProductData>(context).chairProducts[index].category,
          );
        },
        itemCount: Provider.of<ProductData>(context).chairProducts.length,
      ),
    );
  }
}

class SofaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductBox(
            product: Provider.of<ProductData>(context).sofaProducts[index],
          );
        },
        itemCount: Provider.of<ProductData>(context).sofaProducts.length,
      ),
    );
  }
}

class CupBoardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductBox(
            product: Provider.of<ProductData>(context).cupBoardProducts[index],
          );
        },
        itemCount: Provider.of<ProductData>(context).cupBoardProducts.length,
      ),
    );
  }
}

class BedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductBox(
            product: Provider.of<ProductData>(context).bedProducts[index],
          );
        },
        itemCount: Provider.of<ProductData>(context).bedProducts.length,
      ),
    );
  }
}

class TableListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductBox(
            product: Provider.of<ProductData>(context).tableProducts[index],
          );
        },
        itemCount: Provider.of<ProductData>(context).tableProducts.length,
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CartProductBox(
            product: Provider.of<ProductData>(context).cartProducts[index],
          );
        },
        itemCount: Provider.of<ProductData>(context).cartProducts.length,
      ),
    );
  }
}
