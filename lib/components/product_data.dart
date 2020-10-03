import 'package:flutter/material.dart';
import 'package:wickwood/components/product_class.dart';

class ProductData extends ChangeNotifier {
  static String chair = 'chairs';
  static String sofa = 'sofas';
  static String cupboard = 'cupboards';
  static String bed = 'beds';
  static String table = 'tables';

  List<Product> chairProducts = [
    Product(
        name: 'Brown Chair',
        material: 'Wood',
        price: 99.99,
        image: 'chair1',
        category: chair),
    Product(
        name: 'Brown Chair',
        material: 'Wood',
        price: 99.99,
        image: 'chair1',
        category: chair),
    Product(
        name: 'Brown Chair',
        material: 'Wood',
        price: 99.99,
        image: 'chair1',
        category: chair),
    Product(
        name: 'Brown Chair',
        material: 'Wood',
        price: 99.99,
        image: 'chair1',
        category: chair),
  ];

  List<Product> sofaProducts = [
    Product(
        name: 'Grey Sofa',
        material: 'Fabric',
        price: 999.99,
        image: 'sofa1',
        category: sofa),
    Product(
        name: 'Grey Sofa',
        material: 'Fabric',
        price: 999.99,
        image: 'sofa1',
        category: sofa),
    Product(
        name: 'Grey Sofa',
        material: 'Fabric',
        price: 999.99,
        image: 'sofa1',
        category: sofa),
    Product(
        name: 'Grey Sofa',
        material: 'Fabric',
        price: 999.99,
        image: 'sofa1',
        category: sofa),
  ];

  List<Product> cupBoardProducts = [
    Product(
        name: 'Wooden Cupboar',
        material: 'Wood',
        price: 999.99,
        image: 'cupboard1',
        category: cupboard),
  ];

  List<Product> bedProducts = [
    Product(
      name: 'Wooden Bed',
      image: 'bed1',
      material: 'wood',
      price: 999.99,
      category: bed,
    ),
    Product(
      name: 'Wooden Bed',
      image: 'bed1',
      material: 'wood',
      price: 999.99,
      category: bed,
    ),
    Product(
      name: 'Wooden Bed',
      image: 'bed1',
      material: 'wood',
      price: 999.99,
      category: bed,
    ),
    Product(
      name: 'Wooden Bed',
      image: 'bed1',
      material: 'wood',
      price: 999.99,
      category: bed,
    ),
  ];

  List<Product> tableProducts = [
    Product(
      name: 'Wooden Table',
      image: 'table1',
      material: 'wood',
      price: 999.99,
      category: table,
    ),
    Product(
      name: 'Wooden Table',
      image: 'table1',
      material: 'wood',
      price: 999.99,
      category: table,
    ),
    Product(
      name: 'Wooden Table',
      image: 'table1',
      material: 'wood',
      price: 999.99,
      category: table,
    ),
    Product(
      name: 'Wooden Table',
      image: 'table1',
      material: 'wood',
      price: 999.99,
      category: table,
    ),
  ];

  List<Product> cartProducts = [];

  void addtocart(Product newProduct) {
    cartProducts.add(newProduct);
    notifyListeners();
  }
}
