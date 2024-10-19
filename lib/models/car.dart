import 'dart:ffi';

class Car {
  final String name;
  final String imageUrl;
  final String shortDescription;
  final String fullDescription;
  final String price;

  Car({
    required this.name,
    required this.imageUrl,
    required this.shortDescription,
    required this.fullDescription,
    required this.price
  });
}
