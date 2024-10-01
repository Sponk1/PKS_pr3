import 'package:flutter/material.dart';
import '../models/car.dart';
import 'car_detail_page.dart';
import 'add_car_page.dart'; 

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List<Car> cars = [
    Car(
        name: 'Toyota Camry',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/6027420/a6a5c00c244f842bbcb329de234b79e1/1200x900',
        shortDescription: '4 650 000 ₽', 
        fullDescription: 'Toyota Camry, 2024  4 650 000 ₽  Электрорегулировка руля'
    ),
    Car(
        name: 'Land Rover Range Rover D3000 MHEV',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/5519299/5fcb4c8dc82509d0209f94233630d56e/1200x900',
        shortDescription: '21 498 000 ₽', 
        fullDescription: 'Автомобиль в наличии. Стоит в нашем салоне в г.Москва. НЕ АРАБ. НЕ АМЕРИКАНЕЦ...'
    ),
    
  ];

  // Функция удаления с подтверждением
  void _deleteCar(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  cars.removeAt(index);
                });
                Navigator.of(context).pop(); 
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(cars[index].imageUrl),
              title: Text(cars[index].name),
              subtitle: Text(cars[index].shortDescription), 
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteCar(index), 
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailPage(car: cars[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarPage(
                onAddCar: (car) {
                  setState(() {
                    cars.add(car); 
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
