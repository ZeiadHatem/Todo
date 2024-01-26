import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/task_data.dart';

import 'Screens/TasksScreen.dart';

void main(){

  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget{

  Widget build(BuildContext context){

    return ChangeNotifierProvider(
      create: (context)=> TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}