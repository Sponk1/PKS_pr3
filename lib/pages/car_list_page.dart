import 'package:flutter/material.dart';
import '../models/car.dart';
import 'car_detail_page.dart';

class CarListPage extends StatelessWidget {
  final List<Car> cars = [
    Car(
      name: 'Toyota Camry',
      imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/6027420/a6a5c00c244f842bbcb329de234b79e1/1200x900',
      shortDescriprion: '4 650 000 ₽',
      fullDescription: 'Toyota Camry, 2024  4 650 000 ₽  Электрорегулировка руля'
    ),
    Car(
        name: 'Land Rover Range Rover D3000 MHEV',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/5519299/5fcb4c8dc82509d0209f94233630d56e/1200x900',
        shortDescriprion: '21 498 000 ₽',
        fullDescription: 'Автомобиль в наличии. Стоит в нашем салоне в г.Москва. НЕ АРАБ. НЕ АМЕРИКАНЕЦ. Привезен в Москву напрямую из Европы 24.08.2024 Вы будете первым официальным собственником автомобиля в России.'
    ),
    Car(
        name: 'Toyota Camry',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/6027420/a6a5c00c244f842bbcb329de234b79e1/1200x900',
        shortDescriprion: '4 650 000 ₽',
        fullDescription: 'Toyota Camry, 2024  4 650 000 ₽  Электрорегулировка руля'
    ),
    Car(
        name: 'Land Rover Range Rover D3000 MHEV',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/5519299/5fcb4c8dc82509d0209f94233630d56e/1200x900',
        shortDescriprion: '21 498 000 ₽',
        fullDescription: 'Автомобиль в наличии. Стоит в нашем салоне в г.Москва. НЕ АРАБ. НЕ АМЕРИКАНЕЦ. Привезен в Москву напрямую из Европы 24.08.2024 Вы будете первым официальным собственником автомобиля в России.'
    ),
    Car(
        name: 'Toyota Camry',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/6027420/a6a5c00c244f842bbcb329de234b79e1/1200x900',
        shortDescriprion: '4 650 000 ₽',
        fullDescription: 'Toyota Camry, 2024  4 650 000 ₽  Электрорегулировка руля'
    ),
    Car(
        name: 'Land Rover Range Rover D3000 MHEV',
        imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/5519299/5fcb4c8dc82509d0209f94233630d56e/1200x900',
        shortDescriprion: '21 498 000 ₽',
        fullDescription: 'Автомобиль в наличии. Стоит в нашем салоне в г.Москва. НЕ АРАБ. НЕ АМЕРИКАНЕЦ. Привезен в Москву напрямую из Европы 24.08.2024 Вы будете первым официальным собственником автомобиля в России.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cars'), backgroundColor: Colors.teal,),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailPage(car: cars[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.network(cars[index].imageUrl),
                title: Text(cars[index].name),
                subtitle: Text(cars[index].shortDescriprion),
              ),
            ),
          );
        }
      ),
    );
  }
}