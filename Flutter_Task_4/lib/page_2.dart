import 'package:flutter/material.dart';
import 'page_1.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double shippingCost = 12.50;

  double getSubTotal() {
    return myCart.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double getTotal() {
    if (myCart.isEmpty) return 0.0;
    return getSubTotal() + shippingCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: myCart.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[500]),
            SizedBox(height: 20),
            Text("Your Cart is Empty", style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: 10),
            Text("Add items from the home screen", style: TextStyle(color: Colors.grey[400])),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(20),
              itemCount: myCart.length,
              separatorBuilder: (ctx, i) => SizedBox(height: 20),
              itemBuilder: (ctx, index) {
                final item = myCart[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 5))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80, height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(item.image), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("£${item.price}", style: TextStyle(color: Colors.deepOrange)),
                            Text("Size: ${item.size}", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () => setState(() => item.quantity++),
                          ),
                          Text("${item.quantity}", style: TextStyle(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (item.quantity > 1) {
                                  item.quantity--;
                                } else {
                                  myCart.removeAt(index);
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
            ),
            child: Column(
              children: [
                _buildSummaryRow("Subtotal:", "£${getSubTotal().toStringAsFixed(2)}"),
                SizedBox(height: 10),
                _buildSummaryRow("Shipping:", "£${shippingCost.toStringAsFixed(2)}"),
                SizedBox(height: 10),
                Divider(color: Colors.grey[300]),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("£${getTotal().toStringAsFixed(2)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Checkout Done!"), backgroundColor: Colors.green),
                      );
                    },
                    child: Text("Checkout", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}