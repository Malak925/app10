import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List theMugs = ["Cozy & Warm", "Joy", "Sip & Sip", "Comfy & Cozy  "];

  List<NetworkImage> mugs = [
    NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE4VpaibjWEdSjGcu0-CLKn_5qEn9rTLD92g&usqp=CAU"),
    NetworkImage(
        "https://i5.walmartimages.com/asr/35d8a618-3def-460e-844a-2f8ff0942a85.386a4505ac0a61d258918404017de6bb.jpeg"),
    NetworkImage(
        "https://i5.walmartimages.com/asr/68cc7718-bdda-4dd5-a9db-900606f9b539_1.1797f510ab38a277da7a22122459dc2f.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF"),
    NetworkImage(
        "https://cdn.shopify.com/s/files/1/0571/9729/7848/products/DSC_1479copy_1946x.jpg?v=1661119071")
  ];
  List price = ["8\$", "7\$", "8\$", "10\$"];
  List price1 = ["5\$", "4\$", "5\$", "7\$"];
  String fav = "";
  String cart = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey,
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 77, 77, 77),
          title: Text(
            "Mugs Shop",
            style: TextStyle(fontFamily: 'Pacifico-Regular'),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(
                    "${theMugs[i]}",
                    style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                        color: Color.fromARGB(255, 65, 63, 63)),
                  ),
                  subtitle: Row(children: [
                    Text(
                      "${price[i]}",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      "   ${price1[i]}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                  leading: Image(image: mugs[i]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            AlertDialog alert = AlertDialog(
                              backgroundColor: Colors.pink,
                              title: Text("Favourite",
                                  style: TextStyle(
                                      fontFamily: 'Pacifico-Regular',
                                      color: Colors.black)),
                              content: Text(
                                "${theMugs[i]} is added to your favourite",
                                style: TextStyle(
                                    fontFamily: 'Pacifico-Regular',
                                    color: Colors.black),
                              ),
                              actions: [
                                Text("OK"),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          label: Text("")),
                      TextButton.icon(
                          onPressed: () {
                            AlertDialog alert = AlertDialog(
                              backgroundColor: Colors.grey,
                              title: Text("Cart",
                                  style: TextStyle(
                                      fontFamily: 'Pacifico-Regular',
                                      color: Colors.black)),
                              content: Text(
                                  "${theMugs[i]} is added to your cart",
                                  style: TextStyle(
                                      fontFamily: 'Pacifico-Regular',
                                      color: Colors.black)),
                              actions: [
                                Text("OK"),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          icon: Icon(
                            Icons.shopping_basket_sharp,
                            color: Colors.grey,
                          ),
                          label: Text(""))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
