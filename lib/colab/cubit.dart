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
  List<dynamic> archit = [];
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

  void getdata() {
    emit(WaitBussinesState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'e391fa4f5e904de09b183731be861079'
    }).then((value) {
      archit = value.data['articles'];
      emit(ArticBussinesState());
      print(archit.toString());
    }).catchError((e) {
      emit(ErrorBussinesState(e: e.toString()));
    });
    //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=e391fa4f5e904de09b183731be861079
  }
}
