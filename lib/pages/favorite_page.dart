import 'package:flutter/material.dart';
import '../models/car.dart';

class FavoritePage extends StatelessWidget {
  final List<Car> favoriteCars;
  final Function(Car) onRemoveFavorite; // Функция для удаления из избранного

  FavoritePage({required this.favoriteCars, required this.onRemoveFavorite});

  @override
  Widget build(BuildContext context) {
    return favoriteCars.isEmpty
        ? Center(child: Text('Нет избранных автомобилей.'))
        : GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: favoriteCars.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  favoriteCars[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriteCars[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(favoriteCars[index].shortDescription),
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        onRemoveFavorite(favoriteCars[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
