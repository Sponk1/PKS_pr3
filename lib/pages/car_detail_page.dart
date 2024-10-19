import 'package:flutter/material.dart';
import '../models/car.dart';

class CarDetailPage extends StatelessWidget {
  final Car car;
  final Function(Car) onAddToCart;
  final Function(Car) onAddToFavorites;

  CarDetailPage({required this.car, required this.onAddToCart, required this.onAddToFavorites});

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
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => onAddToFavorites(car),
                  child: Text('Add to Favorites'),
                ),
                ElevatedButton(
                  onPressed: () => onAddToCart(car),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
