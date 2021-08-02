import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/layout/bussiness.dart';
import 'package:myapi/layout/sciences.dart';
import 'package:myapi/layout/setting.dart';
import 'package:myapi/layout/sport.dart';
import 'package:myapi/shared/dio_H.dart';

import 'state.dart';

class Newcubit extends Cubit<NewsState> {
  Newcubit() : super(InitNewState());
  static Newcubit get(context) => BlocProvider.of(context);
  var currentindex = 0;

  ThemeMode appmode = ThemeMode.light;
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> bussin = [];
  List<BottomNavigationBarItem> bottomnav = [
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'bussiness'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
  ];
  List<Widget> boddy = [
    Sciencescreen(),
    Bussinessscreen(),
    Sportscreen(),
    Settingscreen()
  ];
  changebottonindex(index) {
    currentindex = index;
    emit(BottomNavState());
  }

  void getdata() async {
    emit(WaitBussinesState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'e391fa4f5e904de09b183731be861079'
    }).then((value) {
      bussin = value.data['articles'];
      emit(ArticBussinesState());
      bussin.forEach((element) {
        //   print(element['urlToImage']);
      });
    }).catchError((e) {
      print(e.toString());
      emit(ErrorBussinesState(e: e.toString()));
    });
    //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e391fa4f5e904de09b183731be861079
  }

  void getdata2() async {
    emit(WaitscienceState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'e391fa4f5e904de09b183731be861079'
    }).then((value) {
      science = value.data['articles'];
      science.forEach((element) {
        // print(element['urlToImage']);
      });
      emit(ArticscienceState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorscienceState(e: e.toString()));
    });
    //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e391fa4f5e904de09b183731be861079
  }

  void getdata3() async {
    emit(WaitsportsState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': 'e391fa4f5e904de09b183731be861079'
    }).then((value) {
      sport = value.data['articles'];
      sport.forEach((element) {
        //  print(element['urlToImage']);
      });
      emit(ArticsportsState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorsportsState(e: e.toString()));
    });
    //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e391fa4f5e904de09b183731be861079
  }

  void changemode() {
    if (appmode == ThemeMode.dark)
      appmode = ThemeMode.light;
    else if (appmode == ThemeMode.light) appmode = ThemeMode.dark;
    //print(appmode.toString());
    emit(ChangemodeState());
  }

  List<dynamic> searched = [];
  void getdatanew(s) {
    emit(WaitSearchState());
    DioHelper.getData(
            url: 'v2/top-headlines',
            query: {'q': s, 'apiKey': 'e391fa4f5e904de09b183731be861079'})
        .then((value) {
      searched = value.data['articles'];
      emit(ArticSearchState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorSearchState(e: e.toString()));
    });
  }
}
