import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapi/colab/cubit.dart';
import 'package:myapi/shared/component.dart';

class Sportscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: articleBuilder(Newcubit.get(context).archit),
    );
  }
}
