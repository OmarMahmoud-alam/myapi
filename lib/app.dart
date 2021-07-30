import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/colab/cubit.dart';
import 'package:myapi/colab/state.dart';
//import 'package:myapi/shared/dio_H.dart';

class MyMainapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Newcubit()..getdata2(),
      child: BlocConsumer<Newcubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Newcubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Api Learn'),
            ),
            body: cubit.boddy[cubit.currentindex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index) {
                if (index == 1 && cubit.bussin.length == 0) cubit.getdata();
                if (index == 2 && cubit.sport.length == 0) cubit.getdata3();
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
