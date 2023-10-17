import 'package:http/http.dart' as http;
import 'dart:convert';
class TaskApiService {
  final String baseUrl; // Replace with your server's API URL

  TaskApiService(this.baseUrl);

  // Method to fetch tasks from the server
  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));

    if (response.statusCode == 200) {
      List<dynamic> tasks = json.decode(response.body);
      return List<Map<String, dynamic>>.from(tasks);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  // Method to create a task on the server
  Future<void> createTask(Map<String, dynamic> taskData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(taskData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create a task');
    }
  }
}
