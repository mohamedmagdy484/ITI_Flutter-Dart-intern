class ProductsModel {
  List<Product> products = [];

  ProductsModel({required this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  int? id;
  String? title;
  double? price;
  String? thumbnail;

  int quantity;

  Product({
    this.id,
    this.title,
    this.price,
    this.thumbnail,
    this.quantity = 0
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = (json['price'] as num?)?.toDouble(),
        thumbnail = json['thumbnail'],
        quantity = 0;
}