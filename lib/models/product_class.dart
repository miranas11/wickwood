class Product {
  final String mediaUrl;
  final String name;
  final String material;
  final double price;
  final String category;
  final String productId;
  final dynamic likes;
  int quantity;
  Product({
    this.likes,
    this.name = '',
    this.material = '',
    this.price = 0,
    this.category,
    this.mediaUrl = '',
    this.productId = '',
    this.quantity = 1,
  });

  factory Product.fromDocument(doc) {
    return Product(
      name: doc['name'],
      material: doc['material'],
      price: doc['price'],
      category: doc['category'],
      mediaUrl: doc['mediaUrl'],
      productId: doc['productId'],
      quantity: doc['quantity'],
      likes: doc['likes'],
    );
  }

  getlikescount(likes) {
    if (likes == null) {
      return 0;
    }
    int likescount = 0;
    likes.values.forEach((val) {
      if (val == true) {
        likescount++;
      }
    });

    return likescount;
  }
}
