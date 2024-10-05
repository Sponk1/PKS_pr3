import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ФИО: Жлудов И.А.'),
          Text('Группа: ЭФБО-03-22'),
          Text('Номер телефона: +7 999 999 99 99'),
          Text('Почта: example@example.com'),
        ],
      ),
    );
  }
}
