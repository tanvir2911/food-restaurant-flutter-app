import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodly_ui/app_name_widget.dart';
import 'package:foodly_ui/card/product_card.dart';
import 'package:foodly_ui/cart/cart.dart';
import 'package:foodly_ui/controller/cart_provider.dart';
import 'package:foodly_ui/drawer/drawer_menu.dart';
import 'package:foodly_ui/model/product_model.dart';
import 'package:foodly_ui/text/text_builder.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

export 'package:provider/provider.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<ProductModel>>? futureProduct;
  Future<List<ProductModel>> fetchProducts() async {
    List<ProductModel> products = [];
    // const baseUrl = 'https://fakestoreapi.com/products';
    const baseUrl = 'https://restaurant-spring-render.onrender.com/foodItems';
    var request = http.Request('GET', Uri.parse(baseUrl));

    http.StreamedResponse response = await request.send();
    var responseBody =
        await response.stream.bytesToString(); // Store the response body

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(responseBody);
      }
      final jsonData = jsonDecode(responseBody);
      products =
          jsonData.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      setState(() {}); // Assuming this is within a Stateful widget

      return products;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const AppNameWidget(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Cart()));
            },
            icon: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: cart.itemCount != 0 ? 8 : 0,
                      right: cart.itemCount != 0 ? 8 : 0),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                if (cart.itemCount != 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: TextBuilder(
                        text: cart.itemCount.toString(),
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<ProductModel>>(
          future: futureProduct,
          builder: (context, data) {
            if (data.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: data.data!.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return ProductCard(product: data.data![i]);
                },
              );
            } else if (data.hasError) {
              return Text("${data.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
