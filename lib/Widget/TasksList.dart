import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/task_data.dart';
import 'package:todo/Widget/Task_Tile.dart';


class TasksList extends StatelessWidget {

  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context , taskData , child){
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context , index){
              return TasksTile(
                isChecked: taskData.tasks[index].isDone ,
                taskTitle: taskData.tasks[index].name,
                checkBoxChange: (newValue){
                 taskData.updateTask(taskData.tasks[index]);
                },
                Delete: (){
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            }
        );
      },
    );
  }
}
