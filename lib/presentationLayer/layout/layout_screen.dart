import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/data_layer/bloc/cubit/cubit.dart';
import 'package:to_do_1/data_layer/bloc/cubit/states.dart';
import 'package:to_do_1/presentationLayer/shared/constant/constant.dart';
import 'package:to_do_1/presentationLayer/widgets/bottom_sheet.dart';

class LayoutScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();

  var taskTitleController = TextEditingController();
  var taskDescriptionController = TextEditingController();
  var taskTimeController = TextEditingController();
  var taskDateController = TextEditingController();

///////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoAppCubit()..createDatabase(),
      child: BlocConsumer<ToDoAppCubit, ToDoAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ToDoAppCubit.get(context);

          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(
                "TasksApp",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.toggleBetweenAppTheme();
                  },
                  icon: Icon(
                    isDark ? Icons.wb_sunny_outlined : Icons.brightness_2,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                cubit.changeFabIcon();
                if (cubit.isBottomSheetShow) {
                  scaffoldkey.currentState!
                      .showBottomSheet(
                        (context) => bottomSheet(
                          formkey,
                          taskTitleController,
                          taskTimeController,
                          taskDateController,
                          taskDescriptionController,
                          context,
                        ),
                        elevation: 10,
                      )
                      .closed
                      .then((value) {
                    cubit.changeFabIcon();
                  });
                } else {
                  if (formkey.currentState!.validate()) {
                    cubit.insert_data_to_database(
                      title: taskTitleController.text,
                      time: taskTimeController.text,
                      description: taskDescriptionController.text,
                      date: taskDateController.text,
                    );
                    Navigator.pop(context);
                    cubit.changeFabIcon();
                  }
                }
              },
              child: Icon(
                cubit.isBottomSheetShow ? Icons.add : Icons.edit,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.bottomNaviBarIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud_done_outlined),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archives',
                ),
              ],
            ),
            body: cubit.screen[cubit.bottomNaviBarIndex],
          );
        },
      ),
    );
  }
}
