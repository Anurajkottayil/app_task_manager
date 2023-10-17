import 'package:flutter/material.dart';
import 'package:task_manager/Task_View.dart';
import 'package:intl/intl.dart';


class taskCreateForm extends StatefulWidget {
  //const TaskView({super.key});

  @override
  State<taskCreateForm> createState() => _TaskViewState();
}

class _TaskViewState extends State<taskCreateForm> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController taskIdController =TextEditingController();
  final TextEditingController projectIdControler =TextEditingController();
  final TextEditingController moduleIdController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime actualStartDate = DateTime.now();
  DateTime actualEndDate = DateTime.now();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
        
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
           /*  TextFormField(
              controller: startDateController,
              decoration: InputDecoration(labelText: 'start date'),
              validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },
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
            ),*/           
               Row(
                 children: [
                   Text("Start date: ${DateFormat('dd-MM-yyyy').format(startDate)}",style: TextStyle(fontWeight: FontWeight.bold),),
                 
               

            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context, startDate, (date) {
                  setState(() {
                    startDate = date;
                    });
                  });
                }, ),
                 ]
               ),
                 Row(
                   children: [
                     Text("End date: ${DateFormat('dd-MM-yyyy').format(endDate)}",style: TextStyle(fontWeight: FontWeight.bold),),
                  

            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context, endDate, (date) {
                  setState(() {
                    endDate = date;
                    });
                  });
                }, ),
                 ],
                 ),
            
                 
               
                  Row(
                    children: [
                      Text("actual start date: ${DateFormat('dd-MM-yyyy').format(actualStartDate)}",style: TextStyle(fontWeight: FontWeight.bold),),
                    

            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context, actualStartDate, (date) {
                  setState(() {
                    actualStartDate = date;
                    });
                  });
                }, ),
                ],
                  ),
                 Row(
                   children: [
                     Text(
                      
                      "actual end date: ${DateFormat('dd-MM-yyyy').format(actualEndDate)}",style: TextStyle(fontWeight: FontWeight.bold),),
                  

            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                _selectDate(context, actualEndDate, (date) {
                  setState(() {
                    actualEndDate = date;
                    });
                  });
                }, ),
                 ],
                 ),
              
            
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
                    DateTime selectStartDate = startDate;
                    DateTime selectEndDate = endDate;
                    DateTime selectActualStartDate = actualStartDate;
                    DateTime seletActualEndDate = actualEndDate;

                  }
                }, child: Text("Create")),
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