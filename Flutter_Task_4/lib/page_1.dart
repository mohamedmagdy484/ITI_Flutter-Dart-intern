import 'package:flutter/material.dart';
import 'page_2.dart';

class CartItem {
  final String name;
  final double price;
  final String image;
  final String size;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    this.quantity = 1,
  });
}

List<CartItem> myCart = [];

class Product {
  final String name;
  final String priceString;
  final double priceValue;
  final String image;
  bool isFavorite;

  Product({
    required this.name,
    required this.priceString,
    required this.priceValue,
    required this.image,
    this.isFavorite = false,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(name: 'Jacket Boucle', priceString: '£72.59', priceValue: 72.59, image: 'assets/images/jacket.jpg', isFavorite: true),
    Product(name: 'Blue Hoodie', priceString: '£55.00', priceValue: 55.00, image: 'assets/images/hoodie.jpg'),
    Product(name: 'Leather Jacket', priceString: '£120.00', priceValue: 120.00, image: 'assets/images/leather.jpg'),
    Product(name: 'Grey Jacket', priceString: '£85.00', priceValue: 85.00, image: 'assets/images/jacket_2.jpg'),
  ];

  void toggleFavorite(int index) {
    setState(() {
      products[index].isFavorite = !products[index].isFavorite;
    });
  }

  void addToCart(Product product) {
    setState(() {
      bool exists = false;
      for (var item in myCart) {
        if (item.name == product.name) {
          item.quantity++;
          exists = true;
          break;
        }
      }
      if (!exists) {
        myCart.add(CartItem(
          name: product.name,
          price: product.priceValue,
          image: product.image,
          size: 'L',
        ));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Added to Cart!"), duration: Duration(milliseconds: 1500), backgroundColor: Colors.deepOrange),
    );
  }

  void _onItemTapped(int index) async {
    if (index == 2) {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,", style: TextStyle(color: Colors.grey, fontSize: 16)),
                Text("Mohamed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              ],
            ),
            CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/profile.jpg')),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 20),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index], index);
                },
              ),
            ),

            Transform.translate(
              offset: Offset(0, 20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.gif'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: ListTile(
                    title: Text("Winter\nCollections", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("Start finding your best", style: TextStyle(color: Colors.white70)),
                    trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
        ),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Fav'),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text('${myCart.length}'),
                isLabelVisible: myCart.isNotEmpty,
                child: Icon(Icons.shopping_cart_outlined),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 5, spreadRadius: 1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage(product.image), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 8, right: 8,
                  child: InkWell(
                    onTap: () => toggleFavorite(index),
                    child: CircleAvatar(
                      backgroundColor: Colors.white, radius: 14,
                      child: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border, color: product.isFavorite ? Colors.red : Colors.grey, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.priceString, style: TextStyle(color: Colors.grey, fontSize: 12)),
                    InkWell(
                      onTap: () => addToCart(product),
                      child: Icon(Icons.add_circle, color: Colors.deepOrange, size: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}