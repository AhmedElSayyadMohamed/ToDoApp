import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_1/data_layer/bloc/cubit/cubit.dart';

Widget default_TextFormField({
  required TextEditingController? controller,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double radius = 50,
  required String? labelText,
  TextInputType? keyboardType,
  bool obscureText = false,
  ValueChanged<String>? onFieldSubmitted,
  ValueChanged<String>? onChange,
  FormFieldValidator<String>? validator,
  GestureTapCallback? onTap,
  double textFormFieldHeight = 10,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      contentPadding:
          EdgeInsets.symmetric(vertical: textFormFieldHeight, horizontal: 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.blue, width: 2)),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
    ),
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChange,
    validator: validator,
    onTap: onTap,
  );
}
////////////////////////////////////////////////////

Widget task_desine(Map task, context) {
  return Dismissible(
    key: Key(task['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Title : ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20, color: Colors.black54),
                    ),
                    Text(
                      task['title'],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    // Spacer(),
                    // Text(
                    //   task['time'],
                    //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    //         color: Colors.redAccent,
                    //       ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    task['description'],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      ToDoAppCubit.get(context).update_data(
                        status: 'done',
                        id: task["id"],
                      );
                    },
                    icon: Icon(
                      Icons.cloud_done_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ToDoAppCubit.get(context).update_data(
                        status: 'archive',
                        id: task["id"],
                      );
                    },
                    icon: Icon(
                      Icons.archive_outlined,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        task['time'],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    background: Container(
      color: Colors.red,
      padding: EdgeInsets.only(left: 20.0),
    ),
    onDismissed: (direction) {
      ToDoAppCubit.get(context).delete_data(id: task['id']);
    },
  );
}
