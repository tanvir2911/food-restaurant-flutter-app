import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodly_ui/app_name_widget.dart';
import 'package:foodly_ui/card/cart_card.dart';
import 'package:foodly_ui/controller/cart_provider.dart';
import 'package:foodly_ui/menuItems/menuItems.dart';
import 'package:foodly_ui/text/text_builder.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.sizeOf(context);

    final String apiUrl =
        'https://restaurant-spring-render.onrender.com/orders';
    String result = '';

    Future<void> _postData() async {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            // 'name': nameController.text,
            // 'id': 4,
            'orderItems': "Grilled ribs, Noodles",
            'netAmount': cart.totalPrice(),
            'userId': 1,
            'time': DateTime.now(),
            'address': "Khilgaon",
            'orderStatus': "pending",
            // 'email': emailController.text,
            // Add any other data you want to send in the body
          }),
        );

        if (response.statusCode == 200) {
          // Successful POST request, handle the response here
          final responseData = jsonDecode(response.body);
          setState(() {
            result = 'Item added successfully';
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MenuItems()));
        } else {
          // If the server returns an error response, throw an exception
          throw Exception('Failed to post data');
        }
      } catch (e) {
        setState(() {
          result = 'Error: $e';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: TextBuilder(
                text: cart.itemCount.toString(),
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: cart.items.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return CartCard(cart: cart.items[i]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10.0);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          height: 60,
          color: Colors.black,
          minWidth: size.width,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const MenuItems()));
            cart.clearCart();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBuilder(
                  text: 'Tk. ${cart.totalPrice()}',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              const SizedBox(width: 10.0),
              const TextBuilder(
                text: 'Pay Now',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
