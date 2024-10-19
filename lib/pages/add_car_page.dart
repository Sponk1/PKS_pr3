import 'package:flutter/material.dart';
import '../models/car.dart';

class AddCarPage extends StatefulWidget {
  final Function(Car) onAddCar;

  AddCarPage({required this.onAddCar});

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _shortDescriptionController = TextEditingController();
  final TextEditingController _fullDescriptionController = TextEditingController();
  final TextEditingController _price = TextEditingController();

  void _addCar() {
    final newCar = Car(
      name: _nameController.text,
      imageUrl: _imageUrlController.text,
      shortDescription: _shortDescriptionController.text,
      fullDescription: _fullDescriptionController.text,
      price: _price.text
    );
    widget.onAddCar(newCar);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Car')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Car Name'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _shortDescriptionController,
              decoration: InputDecoration(labelText: 'Short Description'),
            ),
            TextField(
              controller: _fullDescriptionController,
              decoration: InputDecoration(labelText: 'Full Description'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCar,
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
