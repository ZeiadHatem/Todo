import 'package:flutter/material.dart';


class TasksTile extends StatelessWidget {

  final bool isChecked ;
  final String taskTitle;
  final void Function(bool?) checkBoxChange;
  final void Function() Delete;
  TasksTile({required this.Delete , required this.isChecked ,required this.taskTitle , required this.checkBoxChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle , style: TextStyle(decoration: isChecked?TextDecoration.lineThrough : null),),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkBoxChange,
      ),
      onLongPress: Delete,
    );
  }
}


