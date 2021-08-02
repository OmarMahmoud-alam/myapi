import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapi/colab/cubit.dart';
import 'package:myapi/colab/state.dart';
import 'package:myapi/shared/component.dart';

class Search extends StatelessWidget {
  final TextEditingController searchcontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newcubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                flexibleSpace: SafeArea(
                  minimum: EdgeInsets.only(top: 60.0),
                  child: defaultFormField(
                      controller: searchcontroll,
                      type: TextInputType.text,
                      border: InputBorder.none,
                      validate: (s) {
                        if (s!.isEmpty) {
                          return 'must be empty';
                        }
                        return null;
                      },
                      hint: 'search here',
                      onChange: (s) {
                        Newcubit.get(context).getdatanew(s);
                      }),
                ),
              ),
              body: articleBuilder(Newcubit.get(context).searched,
                  context: context));
        },
        listener: (context, state) {});
  }
}
