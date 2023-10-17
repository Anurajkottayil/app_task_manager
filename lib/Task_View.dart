import 'package:flutter/material.dart';
import 'package:task_manager/Task_edit.dart';
import 'package:task_manager/Task_Details.dart';
import 'package:task_manager/task_create1.dart';
import 'task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskView extends StatefulWidget {
 // const TaskView({Key key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<Tasklist> tasks = [];
  String selectedProjectId = '';
  List<String> projectIds = []; // Store available project IDs

  Future<void> fetchtasks() async {
    final Uri apiUrl = Uri.parse('http://localhost:5000/task_view');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        tasks = jsonData.map((item) => Tasklist.fromJson(item)).toList();
      });
    }
  }

  Future<void> fetchProjectIds() async {
    final Uri projectUrl = Uri.parse('http://localhost:5000/project_ids');
    final response = await http.get(projectUrl);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        projectIds = jsonData.cast<String>().toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProjectIds(); // Fetch project IDs
    fetchtasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: 
      
      Column(
        children: [
          DropdownButton<String>(
            value: selectedProjectId,
            onChanged: (newValue) {
              setState(() {
                selectedProjectId = toString();
              });
              fetchtasks(); // Fetch tasks when project ID changes
            },
            items: projectIds.map((projectId) {
              return DropdownMenuItem(value: projectId, child: Text(projectId));
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text('task ID : ${task.taskId}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Project ID : ${task.projectId}'),
                      Text('status : ${task.status}'),
                    ],
                    
                  ),
                
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => taskDetails()),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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