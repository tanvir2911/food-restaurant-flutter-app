import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodly_ui/app_name_widget.dart';
import 'package:foodly_ui/controller/cart_provider.dart';
import 'package:foodly_ui/menuItems/menuItems.dart';
import 'package:foodly_ui/text/text_builder.dart';
import 'package:http/http.dart' as http;

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
          // setState(() {
          //   result = 'Item added successfully';
          // });
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MenuItems()));
        } else {
          // If the server returns an error response, throw an exception
          // throw Exception('Failed to post data');
        }
      } catch (e) {
        // setState(() {
        //   result = 'Error: $e';
        // });
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
          child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: [
          Row(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextBuilder(
                            text: 'Roasted Ribs X 2',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            maxLines: 3,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Row(
                          children: [
                            // IconButton(
                            //     padding: EdgeInsets.zero,
                            //     onPressed: () {
                            //       provider.decreaseQuantity(cart.id!);
                            //     },
                            //     icon: const Icon(
                            //       Icons.remove_circle_outline,
                            //       color: Colors.black,
                            //     )),
                            // TextBuilder(
                            //   text: "FF",
                            //   color: Colors.black,
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w500,
                            // ),
                            // IconButton(
                            //     onPressed: () {
                            //       // provider.increaseQuantity(cart.id!);
                            //     },
                            //     icon: const Icon(
                            //       Icons.add_circle_outline,
                            //       color: Colors.black,
                            //     ))
                          ],
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const TextBuilder(
                                text: 'Total: ',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                              TextBuilder(
                                text: "Tk. 1000",
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      )),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: MaterialButton(
      //     height: 60,
      //     color: Colors.black,
      //     minWidth: size.width,
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //     onPressed: _postData,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextBuilder(
      //             text: 'Tk. ${cart.totalPrice()}',
      //             color: Colors.white,
      //             fontWeight: FontWeight.w600,
      //             fontSize: 20),
      //         const SizedBox(width: 10.0),
      //         const TextBuilder(
      //           text: 'Pay Now',
      //           color: Colors.white,
      //           fontSize: 18,
      //           fontWeight: FontWeight.normal,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
