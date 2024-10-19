import 'package:flutter/material.dart';
import '../models/car.dart';

class CartModel extends ChangeNotifier {
  final List<Car> _items = [];
  final Map<Car, int> _quantities = {};

  List<Car> get items => _items;
  Map<Car, int> get quantities => _quantities;

  int get totalItems => _quantities.values.fold(0, (sum, qty) => sum + qty);

  double get totalPrice => _items.fold(0, (sum, car) => sum + (int.parse(car.price) * _quantities[car]!));

  void addToCart(Car car) {
    if (_quantities.containsKey(car)) {
      _quantities[car] = _quantities[car]! + 1;
    } else {
      _items.add(car);
      _quantities[car] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Car car) {
    if (_quantities[car] == 1) {
      _items.remove(car);
      _quantities.remove(car);
    } else {
      _quantities[car] = _quantities[car]! - 1;
    }
    notifyListeners();
  }

  void removeAllFromCart(Car car) {
    _items.remove(car);
    _quantities.remove(car);
    notifyListeners();
  }
}