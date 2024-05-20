import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodly_ui/menuItems/menuItems.dart';
import 'package:http/http.dart' as http;

class AddToMenu extends StatefulWidget {
  @override
  _AddToMenuState createState() => _AddToMenuState();
}

class _AddToMenuState extends State<AddToMenu> {
  final String apiUrl =
      'https://restaurant-spring-render.onrender.com/foodItems';
  // final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController foodImageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  String result = ''; // To store the result from the API call

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    foodImageController.dispose();
    priceController.dispose();
    quantityController.dispose();
    // emailController.dispose();
    super.dispose();
  }

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
          'title': titleController.text,
          'description': descriptionController.text,
          'foodImage': foodImageController.text,
          'price': priceController.text,
          'quantity': quantityController.text,
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => MenuItems()));
      } else {
        // If the server returns an error response, throw an exception
        // throw Exception('Failed to post data');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food Items to the Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: foodImageController,
              decoration: InputDecoration(labelText: 'Food Image'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            ElevatedButton(
              onPressed: _postData,
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
