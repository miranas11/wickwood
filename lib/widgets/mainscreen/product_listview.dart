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
            name: Provider.of<ProductData>(context).chairProducts[index].name,
            material:
                Provider.of<ProductData>(context).chairProducts[index].material,
            price: Provider.of<ProductData>(context).chairProducts[index].price,
            image: Provider.of<ProductData>(context).chairProducts[index].image,
            categoryname:
                Provider.of<ProductData>(context).chairProducts[index].category,
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
            name: Provider.of<ProductData>(context).sofaProducts[index].name,
            material:
                Provider.of<ProductData>(context).sofaProducts[index].material,
            price: Provider.of<ProductData>(context).sofaProducts[index].price,
            image: Provider.of<ProductData>(context).sofaProducts[index].image,
            categoryname:
                Provider.of<ProductData>(context).sofaProducts[index].category,
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
            name:
                Provider.of<ProductData>(context).cupBoardProducts[index].name,
            material: Provider.of<ProductData>(context)
                .cupBoardProducts[index]
                .material,
            price:
                Provider.of<ProductData>(context).cupBoardProducts[index].price,
            image:
                Provider.of<ProductData>(context).cupBoardProducts[index].image,
            categoryname: Provider.of<ProductData>(context)
                .cupBoardProducts[index]
                .category,
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
            name: Provider.of<ProductData>(context).bedProducts[index].name,
            material:
                Provider.of<ProductData>(context).bedProducts[index].material,
            price: Provider.of<ProductData>(context).bedProducts[index].price,
            image: Provider.of<ProductData>(context).bedProducts[index].image,
            categoryname:
                Provider.of<ProductData>(context).bedProducts[index].category,
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
            name: Provider.of<ProductData>(context).tableProducts[index].name,
            material:
                Provider.of<ProductData>(context).tableProducts[index].material,
            price: Provider.of<ProductData>(context).tableProducts[index].price,
            image: Provider.of<ProductData>(context).tableProducts[index].image,
            categoryname:
                Provider.of<ProductData>(context).tableProducts[index].category,
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
            name: Provider.of<ProductData>(context).cartProducts[index].name,
            material:
                Provider.of<ProductData>(context).cartProducts[index].material,
            price: Provider.of<ProductData>(context).cartProducts[index].price,
            image: Provider.of<ProductData>(context).cartProducts[index].image,
            categoryname:
                Provider.of<ProductData>(context).cartProducts[index].category,
          );
        },
        itemCount: Provider.of<ProductData>(context).cartProducts.length,
      ),
    );
  }
}
