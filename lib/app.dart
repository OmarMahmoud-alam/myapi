import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/colab/cubit.dart';
import 'package:myapi/colab/state.dart';

class MyMainapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Newcubit(),
      child: BlocConsumer<Newcubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Newcubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Api Learn'),
            ),
            body: cubit.boddy[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changebottonindex(index);
              },
              items: cubit.bottomnav,
            ),
          );
        },
      ),
    );
  }
}
