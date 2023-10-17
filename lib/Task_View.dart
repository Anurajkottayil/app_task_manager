import 'package:flutter/material.dart';
import 'package:task_manager/Task_edit.dart';
import 'package:task_manager/Task_Details.dart';
import 'package:task_manager/task_create1.dart';
import 'task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
   List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  String selectedDropdownValue1 = 'Item 1';
  String selectedDropdownValue2 = 'Item 2';
    List<Taskdetails> projectIds = [];
   Future<void> fetchProjectIds() async {
    final Uri projectUrl = Uri.parse('http://localhost:5000//view_project');
    final response = await http.get(projectUrl);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        projectIds = jsonData.cast<Taskdetails>().toList();
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Task Manager"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedDropdownValue1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDropdownValue1 = newValue!;
                    });
                  },
                  items: projectIds.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: DropdownButton<String>(
                  value: selectedDropdownValue2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDropdownValue2 = newValue!;
                    });
                  },
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("TaskID"),
                  subtitle: Text("STATUS"),
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