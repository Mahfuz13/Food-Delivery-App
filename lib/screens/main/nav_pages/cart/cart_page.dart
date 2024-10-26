import 'package:flutter/material.dart';
import 'package:app/screens/payment/payment_screen.dart';
import 'package:app/theme/style.dart';

import '../../../../widgets/button_container_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "title": "Pizza",
      "image": "pizza_popular_3.png",
      "price": 234,
      "quantity": 1
    },
    {"title": "Apples", "image": "fruit_1.png", "price": 150, "quantity": 1},
  ];

  // Function to remove an item from the cart
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  // Function to increase quantity
  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Function to decrease quantity
  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  // Function to calculate the total price
  double _calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Image.asset("assets/word_app_logo.png"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${cartItems.length} items in the cart",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return _itemCartWidget(
                    index: index,
                    title: cartItems[index]['title'],
                    image: cartItems[index]['image'],
                    price: cartItems[index]['price']
                        .toString(), // Convert int to String
                    quantity: cartItems[index]['quantity'],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "TK ${_calculateTotal().toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ButtonContainerWidget(
              title: "Checkout",
              onTap: () {
                // Pass the calculated total to the PaymentScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentScreen(amount: _calculateTotal()),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _itemCartWidget(
      {int? index,
      String? title,
      String? price,
      String? image,
      int? quantity}) {
    return Container(
      width: double.infinity,
      height: 115,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            spreadRadius: 1.5,
            blurRadius: 6.5,
            color: Colors.grey[300]!,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Row(
          children: [
            Image.asset("assets/$image"),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$title",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () => _removeItem(index!),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGreyColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              color: primaryColorED6E1B,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text("Times Food"),
                  const SizedBox(height: 5),
                  Text(
                    "TK $price",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => _decreaseQuantity(index!),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child: const Center(
                            child: Icon(Icons.remove_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text("$quantity"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _increaseQuantity(index!),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child: const Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
