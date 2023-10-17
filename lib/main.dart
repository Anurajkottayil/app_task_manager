import 'package:flutter/material.dart';
import 'package:task_manager/Task_edit.dart';
import 'package:task_manager/Task_View.dart';
import 'package:task_manager/task_model.dart';
import 'task_create1.dart';
import 'Task_Details.dart';
import 'task_edit.dart';



void main() {
  runApp( TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:TaskView(),
      theme: ThemeData(primarySwatch: Colors.deepPurple ),
    );
  }
}
