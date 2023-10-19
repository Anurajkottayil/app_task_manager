/*import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'dart:io';
import 'Task_View.dart';


class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
    List<Map<String, String>> projects = [];
  final dio = Dio();
   List<String> projectIds = [];
  String selectedProjectId = '';
  String selectedValue1 = 'Option 1';
    String selectedValue2 = 'Option 1';


  @override
 void initState() {
    super.initState();
    fetchProjectData();
  }

  Future<void> fetchProjectData() async {
    try {
      final response = await dio.get('http://localhost:5000/task_view');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        final List<Map<String, String>> projectData = jsonData.map((data) {
          return DropDownModel(

          );
/*
            'task_id': data['task_id'].toString(),
            'project_id': data['project_id'].toString(),
             'module_id': data['module_id'].toString(),
            'startdate': data['startdate'].toString(), 
            'enddate': data['enddate'].toString(), 
            'actualstartdate': data['actualenddate'].toString(), 
            'actualenddate': data['actualenddate'].toString(),
             'plannedeffort': data['plannedeffort'].toString(),
            'actualeffort': data['actualeffort'].toString(),
             'status': data['status'].toString(),
            'remark': data['remark'].toString(),
          //  'project_name': data['project_name'] as String,*/
          
        }).toList();
        setState(() {
          projects = projectData;
         projectIds = projectData
  .map((project) => project['project_id'])
  .where((id) => id != null)
  .map((id) => id!)
  .toList();

        });
      }
    } catch (e) {
      print('Dio error: $e');
    }
  }

  @override

  @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }
}*/