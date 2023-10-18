import 'package:flutter/material.dart';
import 'package:task_manager/Task_View.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'task_model.dart';



class TaskCreate extends StatefulWidget {
  //const TaskView({super.key});
//  final Tasklist tasks;
 //  TaskCreate({Key? key, required this.tasks}) : super(key: key);


  @override
  State<TaskCreate> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskCreate> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController taskIdController =TextEditingController();
  final TextEditingController projectIdControler =TextEditingController(text: "2");
  final TextEditingController moduleIdController = TextEditingController();
  final TextEditingController startDateController=TextEditingController();
  final TextEditingController endDateController=TextEditingController();
  final TextEditingController actualStartDateController = TextEditingController();
  final TextEditingController actualEndDateController = TextEditingController();
  final TextEditingController plannedEffortController=TextEditingController();
  final TextEditingController actualEffortController =TextEditingController();
  
  
  String selectedStatus = 'pending'; // Default status

  List<String> statusOptions = ['pending', 'completed'];

  final TextEditingController remarkController= TextEditingController();
 
  Future<void> _selectDate(BuildContext context,DateTime initialDate,Function(DateTime) onDateSelect)async{
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
       );
       if(picked !=null){
        onDateSelect(picked);
       }
  }
  @override
  void initState() {
    super.initState();
   
  
/* Future<void> fetchTaskData() async {
    final Uri apiUrl = Uri.parse('http://your-flask-server-url/get_task_data');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      List<dynamic> taskData = json.decode(response.body);

      if (taskData.isNotEmpty) {
        final firstTask = taskData[0];
        taskIdController.text = firstTask['task_id'];
        projectIdControler.text = firstTask['project_id'];
        moduleIdController.text=firstTask['module_id'];
        startDateController.text=firstTask['start_date'];
        endDateController.text=firstTask['end_date'];
        actualStartDateController.text=firstTask['actual_start_date'];
        actualEndDateController.text=firstTask['actual_end_date'];
        plannedEffortController.text=firstTask['planned_effort'];
        actualEffortController.text=firstTask['actual_effort'];
        remarkController.text=firstTask['remark'];
        // Set other field values in a similar way.
        // This example only sets the first task; you can iterate and set all tasks.
      }
    } else {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch task data. Please check your network connection.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
    }
  }*/

 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update task'),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: taskIdController,
              decoration: InputDecoration(labelText: 'task ID'),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },
            ),
            TextFormField(
              controller: projectIdControler,
              decoration: InputDecoration(labelText: 'projectID'),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the projectID';
                }
                return null;
              },
            ),
            TextFormField(
              controller: moduleIdController,
              decoration: InputDecoration(labelText: 'moduleID'),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the moduleID';
                }
                return null;
              },
            ),
             TextFormField(
              controller: startDateController,
              decoration: InputDecoration(labelText: 'start date'),
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller:endDateController,
              decoration: InputDecoration(labelText: 'end date'),
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller: actualStartDateController,
              decoration: InputDecoration(labelText: 'actual start date'),
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller: actualEndDateController,
              decoration: InputDecoration(labelText: 'actual end date'),
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
           
             /*  Text("Start date: ${DateFormat('dd-MM-yyyy').format(startDate)}"),

            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context, startDate, (date) {
                  setState(() {
                    startDate = date;
                    });
                  });
                }, ),
                 Text("End date :"),
                Text(endDate.toString()),
                IconButton(
                 icon: Icon(Icons.date_range), 
                  onPressed: (){
                  _selectDate(context,endDate,(date){
                    setState(() {
                      endDate=date;
                    });
                  });
                }, ),
            
                 
               
                    Text("Expected start date :"),
                Text(actualStartDate.toString()),
                    IconButton(
                     icon: Icon(Icons.date_range), 
                      onPressed: (){
                      _selectDate(context,actualStartDate,(date){
                        setState(() {
                          actualStartDate=date;
                        });
                      });
                    }, ), 
                 Text("actual start date :"),
                Text(actualEndDate.toString()),
                IconButton(
                 icon: Icon(Icons.date_range), 
                  onPressed: (){
                  _selectDate(context,actualEndDate,(date){
                    setState(() {
                    actualEndDate=date;
                    });
                  });
                }, ),*/
              
            
            TextFormField(
              controller: plannedEffortController,
              decoration: InputDecoration(labelText: 'planned effort'),
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
            TextFormField(
              controller:actualEffortController,
              decoration: InputDecoration(labelText: 'actual effort'),
             /* validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             Row(
               children: [
                Text("Status :   "),
                 DropdownButton<String>(
                  value: selectedStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                  items: statusOptions.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
            ),
               ],
             ),
            TextFormField(
              controller: remarkController,
              decoration: InputDecoration(labelText: 'remark'),
             
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    String taskID = taskIdController.text;
                    String projectID = projectIdControler.text;
                    String moduleID = moduleIdController.text;
                    String plannedEffort = plannedEffortController.text;
                    String actualEffort = actualEffortController.text;
                    String status =selectedStatus;
                    String remark = remarkController.text;
                    String startDate=startDateController.text;
                    String endDate=endDateController.text;
                    String actualStartDate=actualStartDateController.text;
                    String actualEndDate=actualEndDateController.text;

                  }
                }, child: Text("Update")),
              ],
            )
          ],
          ),
          ),
      
         ),
      ),
    );
  }
}