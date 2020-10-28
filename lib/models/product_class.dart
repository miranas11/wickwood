class Product {
  final String mediaUrl;
  final String name;
  final String material;
  final double price;
  final String category;
  final String productId;
  Product({
    this.name = '',
    this.material = '',
    this.price = 0,
    this.category,
    this.mediaUrl = '',
    this.productId = '',
  });

  factory Product.fromDocument(doc) {
    return Product(
      name: doc['name'],
      material: doc['material'],
      price: doc['price'],
      category: doc['category'],
      mediaUrl: doc['mediaUrl'],
      productId: doc['productId'],
    );
  }
}
