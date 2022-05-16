import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/data_layer/bloc/cubit/cubit.dart';
import 'package:to_do_1/data_layer/bloc/cubit/states.dart';
import 'package:to_do_1/presentationLayer/shared/component/components.dart';

class archive_screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = ToDoAppCubit.get(context).archive_tasks;
        return ListView.separated(
          itemBuilder: (context, index) => task_desine(tasks[index], context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Divider(
              thickness: 2,
            ),
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
