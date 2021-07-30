import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/colab/cubit.dart';
import 'package:myapi/shared/component.dart';
import '../colab/state.dart';

class Bussinessscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newcubit, NewsState>(
      builder: (context, state) {
        return articleBuilder(Newcubit.get(context).bussin, context: context);
      },
      listener: (context, state) {},
    );
  }
}
