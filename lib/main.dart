import 'package:flutter/material.dart';
import 'package:myapi/app.dart';
import './shared/dio_H.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.black),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            showUnselectedLabels: true,
          )),
      themeMode: ThemeMode.light,
      home: MyMainapp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
