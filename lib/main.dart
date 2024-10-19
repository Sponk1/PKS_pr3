import 'package:flutter/material.dart';
import 'package:practice3/pages/car_list_page.dart';
import 'pages/car_list_page.dart';
import 'models/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Car Shop',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: CarListPage(),
      ),
    );
  }
}


