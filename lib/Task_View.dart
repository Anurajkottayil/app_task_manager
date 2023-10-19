import 'package:flutter/material.dart';
import 'package:task_manager/Task_edit.dart';
import 'package:task_manager/Task_Details.dart';
import 'package:task_manager/task_create1.dart';
import 'task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/src/material/dropdown.dart';


class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
    List<Map<String, String>> projects = [];
  final dio = Dio();
   List<String> projectIds = [];
  
    //String selectedValue2 = 'Option 2';
 String? selectedProjectId;

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
          return {

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
          //  'project_name': data['project_name'] as String,
          };
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
    return  Scaffold(
      appBar: AppBar(

        title:  Text("Task Manager"),
      ),
      body: SafeArea(
        child: Column( 
          children: [ 
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                
                 children: [
//SizedBox(width: 250,),



                   DropdownButton<String>(
                       value: selectedProjectId,
                       onChanged: ( String? newValue) {
                         setState(() {
                    selectedProjectId = newValue!;
                         });
                       },
                       items:  projectIds.map((String id)
                   {
                         return DropdownMenuItem <String>(
                    value: id,
                    child: Text(id),
                         );
                       }).toList(),
                     ),


                 ],
               ),
             ),
             SizedBox(height: 20,),
      
            Row(
             
            ),
       Expanded(
              child:ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task ID     :"+project['task_id']!),
                Text("Project ID  :"+project['project_id']!),
                Text("Status      :"+project['status']!),
              ],
            ),
            
            onTap: () {
              Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>taskDetails(tasks : project), // Replace with your update form page
          ),
        );
            },
          );
        },
      ),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => taskCreateForm()),
          );
        },
      ),
    );
  }
}