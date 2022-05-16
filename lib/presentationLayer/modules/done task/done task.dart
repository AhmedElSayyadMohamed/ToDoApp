import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/data_layer/bloc/cubit/cubit.dart';
import 'package:to_do_1/data_layer/bloc/cubit/states.dart';
import 'package:to_do_1/presentationLayer/shared/component/components.dart';

class done_task extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = ToDoAppCubit.get(context).done_tasks;
        if (tasks.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image(
                image: AssetImage('assets/images/donetask.png'),
              ),
            ),
          );
        } else {
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
        }
      },
    );
  }
}
