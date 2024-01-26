import 'package:flutter/material.dart';
import 'package:todo/Models/Task.dart';


class TaskData extends ChangeNotifier{

  List<Task> tasks = [
    Task(name: 'Go Shopping' ),
    Task(name: 'Repair The Car'),
    Task(name: 'Go To Gym')
  ];

  void addTask(String newTaskTitle){

    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task){

    tasks.remove(task);
    notifyListeners();
  }
}