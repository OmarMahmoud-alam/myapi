import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/layout/bussiness.dart';
import 'package:myapi/layout/sciences.dart';
import 'package:myapi/layout/setting.dart';
import 'package:myapi/layout/sport.dart';

import 'state.dart';

class Newcubit extends Cubit<NewsState> {
  Newcubit() : super(InitNewState());
  static Newcubit get(context) => BlocProvider.of(context);
  var currentindex = 0;
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
}
