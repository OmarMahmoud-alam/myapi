import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapi/colab/cubit.dart';
import 'package:myapi/colab/state.dart';
import 'package:myapi/shared/component.dart';

class Sciencescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newcubit, NewsState>(
      builder: (context, state) {
        return articleBuilder(Newcubit.get(context).science, context: context);
      },
      listener: (context, state) {},
    );
  }
}
