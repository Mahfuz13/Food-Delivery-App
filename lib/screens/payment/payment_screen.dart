import 'package:flutter/material.dart';
import 'package:app/theme/style.dart';
import 'package:app/widgets/button_container_widget.dart';
import 'package:app/widgets/form_container_widget.dart';
import 'package:flutter_stripe/flutter_stripe.dart'; // Add Stripe package
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart'; // Add this package for URL launch

class PaymentScreen extends StatefulWidget {
  final double amount; // Accept total amount as a parameter

  const PaymentScreen({Key? key, required this.amount}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    super.initState();
    // Set your publishable key here
    Stripe.publishableKey =
        'pk_test_51Q9TVtRwFhCV2hz0B6JA4gFlmV8y2peOOk5Lf9lTqHoDyVct8CLn7WflYX9RTv9x37O0ISpyBEYIJ59fbdKrfrLX00VYpgn4ov';
  }

  Future<void> makePayment() async {
    try {
      // Convert the amount to USD and pass to checkout session
      final response =
          await createCheckoutSession(widget.amount.toString(), 'usd');
      final url = jsonDecode(response.body)['url'];

      // Open the URL in the browser
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error in payment: $e');
    }
  }

  // Updated createCheckoutSession method to connect to your backend
  Future<http.Response> createCheckoutSession(
      String amount, String currency) async {
    try {
      // Your backend API URL (replace localhost with your backend server URL)
      var url = Uri.parse(
          'http://192.168.1.35:4242/create-checkout-session'); // Replace with your server's IP

      return await http.post(
        url,
        body: json
            .encode({'amount': calculateAmount(amount), 'currency': currency}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (err) {
      print('Error creating checkout session: $err');
      throw err;
    }
  }

  // Method to convert the amount into cents
  int calculateAmount(String amount) {
    final price = (double.parse(amount) * 100).round(); // Convert to cents
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset("assets/master_card.png"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset("assets/visa.png"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Image.asset("assets/paypal.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Card Number",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "Enter your card number"),
            const SizedBox(height: 20),
            const Text(
              "Expiration date",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "MM/YY"),
            const SizedBox(height: 20),
            const Text(
              "Security Code",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "Enter your security code"),
            const SizedBox(height: 20),
            Text(
              "Total Amount: \$${widget.amount.toStringAsFixed(2)}", // Show total amount
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ButtonContainerWidget(
              title: "Order now",
              onTap: () async {
                // Start payment process when "Order now" is clicked
                await makePayment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
