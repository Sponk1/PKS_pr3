import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car.dart';
import '../models/cart.dart'; // Подключение модели корзины
import 'car_detail_page.dart';
import 'add_car_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';
import 'cart_page.dart'; // Подключение страницы корзины

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  int _selectedIndex = 0;

  List<Car> cars = [
    Car(
      name: 'Toyota Camry',
      imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/6027420/a6a5c00c244f842bbcb329de234b79e1/1200x900',
      shortDescription: '4 650 000 ₽',
      fullDescription: 'Toyota Camry, 2024  4 650 000 ₽  Электрорегулировка руля',
      price: '4650000',
    ),
    Car(
      name: 'Land Rover Range Rover D3000 MHEV',
      imageUrl: 'https://avatars.mds.yandex.net/get-autoru-vos/5519299/5fcb4c8dc82509d0209f94233630d56e/1200x900',
      shortDescription: '21 498 000 ₽',
      fullDescription: 'Автомобиль в наличии. Стоит в нашем салоне в г.Москва. НЕ АРАБ. НЕ АМЕРИКАНЕЦ...',
      price: '21498000',
    ),
  ];

  List<Car> favoriteCars = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFavorite(Car car) {
    setState(() {
      if (favoriteCars.contains(car)) {
        favoriteCars.remove(car);
      } else {
        favoriteCars.add(car);
      }
    });
  }

  void _removeCar(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to delete this car?'),
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
    Widget body;

    switch (_selectedIndex) {
      case 0:
        body = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(cars[index].imageUrl, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cars[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cars[index].shortDescription),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                favoriteCars.contains(cars[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favoriteCars.contains(cars[index]) ? Colors.red : null,
                              ),
                              onPressed: () => _toggleFavorite(cars[index]),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeCar(index),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarDetailPage(
                                      car: cars[index],
                                      onAddToCart: (car) {
                                        Provider.of<CartModel>(context, listen: false).addToCart(car);
                                      },
                                      onAddToFavorites: _toggleFavorite,
                                    ),
                                  ),
                                );
                              },
                              child: Text('Details', style: TextStyle(fontSize: 12)),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
        break;
      case 1:
        body = FavoritePage(
          favoriteCars: favoriteCars,
          onRemoveFavorite: (car) {
            setState(() {
              favoriteCars.remove(car);
            });
          },
        );
        break;
      case 2:
        body = ProfilePage() as Widget;
        break;
      default:
        body = Center(child: Text('Unknown Page'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        backgroundColor: Colors.teal,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
              Consumer<CartModel>(
                builder: (context, cart, child) {
                  return Positioned(
                    right: 0,
                    child: cart.totalItems > 0
                        ? CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${cart.totalItems}',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                        : SizedBox(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Cars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
