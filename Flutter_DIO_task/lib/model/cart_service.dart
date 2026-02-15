import 'package:flutter_winter_dio/model/product_model.dart';

class CartService {
  static final CartService instance = CartService._();
  CartService._();

  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    var existingItem = _cartItems.firstWhere(
          (element) => element.id == product.id,
      orElse: () => Product(id: -1),
    );

    if (existingItem.id != -1) {
      existingItem.quantity++;
    } else {
      product.quantity = 1;
      _cartItems.add(product);
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((element) => element.id == product.id);
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      removeFromCart(product);
    }
  }

  void increaseQuantity(Product product) {
    product.quantity++;
  }

  double getSubTotal() {
    return _cartItems.fold(0, (sum, item) => sum + ((item.price ?? 0) * item.quantity));
  }
}