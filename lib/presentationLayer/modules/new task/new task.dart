import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_1/data_layer/bloc/cubit/cubit.dart';
import 'package:to_do_1/data_layer/bloc/cubit/states.dart';
import 'package:to_do_1/presentationLayer/shared/component/components.dart';

class new_task extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = ToDoAppCubit.get(context).new_tasks;
        if (tasks.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Image(
                    image: AssetImage('assets/images/notask.png'),
                  ),
                ),
              ),
              Text(
                'You\'ave no new tasks',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'When you have , You will see them here.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 50.0),
                child: Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 25,
                      ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (tasks[index]["date"] ==
                        DateFormat.yMMMd().format(DateTime.now())) {
                      return task_desine(tasks[index], context);
                    } else {
                      return Dismissible(
                        key: Key(tasks[index]['id'].toString()),
                        child: SizedBox(
                          child: Center(
                            child: Text(
                              tasks[index]["date"],
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                        background: Container(
                          color: Colors.red,
                          padding: EdgeInsets.only(left: 20.0),
                        ),
                        onDismissed: (direction) {
                          ToDoAppCubit.get(context)
                              .delete_data(id: tasks[index]['id']);
                        },
                      );
                    }
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  itemCount: tasks.length,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
