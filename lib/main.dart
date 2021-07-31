import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/app.dart';
import 'package:myapi/colab/state.dart';
import './shared/dio_H.dart';
import 'colab/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Newcubit()..getdata2(),
        child: BlocConsumer<Newcubit, NewsState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  iconTheme: IconThemeData(color: Colors.black),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.blue,
                    showUnselectedLabels: true,
                  )),
              darkTheme: ThemeData(
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.grey,
                  ),
                  brightness: Brightness.dark,
                  appBarTheme: AppBarTheme(
                      backgroundColor: Color.fromRGBO(51, 55, 57, 1),
                      iconTheme: IconThemeData(color: Colors.white)),
                  scaffoldBackgroundColor: Color.fromRGBO(51, 55, 57, 1),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    //   backgroundColor: Color.fromRGBO(51, 55, 57, 0.8),
                    unselectedItemColor: Colors.white,
                    selectedItemColor: Colors.blue,
                    showUnselectedLabels: true,
                    backgroundColor: Colors.red,
                    elevation: 0.0,
                  )),
              themeMode: Newcubit.get(context).appmode,
              home: MyMainapp(),
              debugShowCheckedModeBanner: false,
            );
          },
          listener: (context, state) {},
        ));
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
