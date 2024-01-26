import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/Models/task_data.dart';
import 'package:todo/Screens/add_tasks_screen.dart';
import 'package:todo/Widget/TasksList.dart';


class TasksScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check_outlined, size: 40,
                  color: Colors.white,),
                SizedBox(width: 20,),
                Text("ToDayToDo", style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),

            Text('${Provider.of<TaskData>(context).tasks.length} Tasks', style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),),

            SizedBox(height: 20,),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context)=>SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasksScreen()
                  )));
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
    );
  }
}
