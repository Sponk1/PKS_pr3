import 'package:flutter/material.dart';
import '../models/car.dart';

class CarDetailPage extends StatelessWidget {
  final Car car;

  CarDetailPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(car.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(car.imageUrl),
            SizedBox(height: 16.0),
            Text(car.fullDescription, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}