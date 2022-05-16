import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_1/presentationLayer/shared/component/components.dart';

Widget bottomSheet(
  var formkey,
  var taskTitleController,
  var taskTimeController,
  var taskDateController,
  var taskDescriptionController,
  BuildContext context,
) {
  return Container(
    color: Theme.of(context).backgroundColor,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              default_TextFormField(
                  controller: taskTitleController,
                  radius: 10,
                  prefixIcon: Icon(Icons.title),
                  labelText: 'Task Title',
                  onFieldSubmitted: (value) {},
                  onChange: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Task title must not be empty';
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              default_TextFormField(
                  controller: taskTimeController,
                  radius: 10,
                  prefixIcon: Icon(Icons.watch_later_outlined),
                  labelText: 'Task Time',
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      taskTimeController.text =
                          value!.format(context).toString();
                    }).catchError((error) {});
                  },
                  onFieldSubmitted: (value) {},
                  onChange: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Task time must not be empty';
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              default_TextFormField(
                  controller: taskDateController,
                  radius: 10,
                  prefixIcon: Icon(Icons.calendar_today_sharp),
                  labelText: 'Task date',
                  onFieldSubmitted: (value) {},
                  onChange: (value) {},
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-09-20'),
                    ).then((value) {
                      taskDateController.text =
                          DateFormat.yMMMd().format(value!);
                    }).catchError(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Task date must not be empty';
                    }
                  }),
              TextField(
                controller: taskDescriptionController,
                cursorColor: Theme.of(context).primaryColor,
                maxLines: 7,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Description',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
