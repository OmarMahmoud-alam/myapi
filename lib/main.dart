import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapi/app.dart';
import './shared/dio_H.dart';

void main() {
  Bloc.observer = MyBlocObserver();

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

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
