import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/Models/task_data.dart';



class AddTasksScreen extends StatefulWidget{

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  late String task;

  Widget build(BuildContext context){

    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add Task" , textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 30,
            color: Colors.indigo[400],
            fontWeight: FontWeight.bold
          ),),
          TextField(
            onChanged: (value){
              task = value;
            },
            //autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              TextButton(
                onPressed: ()async{
                Provider.of<TaskData>(context , listen: false).addTask(task!);
                SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
                sharedPreferences.setString('task' , task);
                final saveTask = sharedPreferences.getString('task');
                print(saveTask);
                Navigator.pop(context);
              },
                  child: Text("Add"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  primary: Colors.white
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}