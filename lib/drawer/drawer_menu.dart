// import 'package:restaurant_app/imports.dart';
// import 'package:restaurant_app/view/addToMenu/addToMenu.dart';
// import 'package:restaurant_app/view/menuItems/menuItems.dart';

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodly_ui/addToMenu/addToMenu.dart';
import 'package:foodly_ui/app_name_widget.dart';
import 'package:foodly_ui/cart/cart.dart';
import 'package:foodly_ui/const/raw_string.dart';
import 'package:foodly_ui/entry_point.dart';
import 'package:foodly_ui/menuItems/menuItems.dart';
import 'package:foodly_ui/orders/orders.dart';
import 'package:foodly_ui/text/text_builder.dart';
import 'package:foodly_ui/utils/url_launch.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 170.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(RawString.appLogoURL),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBuilder(
                                text: RawString.appName,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            TextBuilder(
                                text: RawString.dummyEmail,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const EntryPoint()));
                          },
                          leading: const Icon(
                            Icons.home,
                            color: Colors.black,
                            size: 20,
                          ),
                          title: const TextBuilder(
                              text: "Home",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Cart()));
                          },
                          leading: const Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                            size: 20,
                          ),
                          title: const TextBuilder(
                              text: "Cart",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          onTap: () {
                            // UrlLaunch.launchInBrowser(
                            //     urlString: RawString.gitHubRepo);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => MenuItems()));
                          },
                          leading: const Icon(Icons.source,
                              color: Colors.black, size: 20),
                          title: const TextBuilder(
                              text: "Menu Items",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          onTap: () {
                            // UrlLaunch.launchInBrowser(
                            //     urlString: RawString.gitHubRepo);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => AddToMenu()));
                          },
                          leading: const Icon(Icons.source,
                              color: Colors.black, size: 20),
                          title: const TextBuilder(
                              text: "Add Menu Item",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          onTap: () {
                            // UrlLaunch.launchInBrowser(
                            //     urlString: RawString.gitHubRepo);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Orders()));
                          },
                          leading: const Icon(Icons.source,
                              color: Colors.black, size: 20),
                          title: const TextBuilder(
                              text: "Orders",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          onTap: () {
                            UrlLaunch.makeEmail(
                                email: RawString.gitHubRepo,
                                body: 'Hello,',
                                subject: 'Can we Talk?');
                          },
                          leading: const Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 20,
                          ),
                          title: const TextBuilder(
                              text: "Contact",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showAboutDialog(
                              applicationName: RawString.appName,
                              context: context,
                              applicationVersion: '1.0.0+1',
                            );
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.black,
                              size: 20,
                            ),
                            title: TextBuilder(
                                text: "About App",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Column(
                children: [
                  const AppNameWidget(),
                  TextBuilder(
                    text: RawString.appDescription,
                    fontSize: 12,
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
