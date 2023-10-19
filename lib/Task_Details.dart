import 'package:flutter/material.dart';
import 'Task_edit.dart';
import 'task_model.dart';
class taskDetails extends StatefulWidget {
    final Map<String, String> tasks;
  taskDetails({Key? key, required this.tasks}) : super(key: key);

  @override
  State<taskDetails> createState() => _taskDetailsState();
}

class _taskDetailsState extends State<taskDetails> {
   final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController taskIdController =TextEditingController();
  final TextEditingController projectIdControler =TextEditingController();
  final TextEditingController moduleIdController = TextEditingController();
  final TextEditingController startDateController=TextEditingController();
  final TextEditingController endDateController=TextEditingController();
  final TextEditingController actualStartDateController = TextEditingController();
  final TextEditingController actualEndDateController = TextEditingController();
  final TextEditingController plannedEffortController=TextEditingController();
  final TextEditingController actualEffortController =TextEditingController();
  final TextEditingController statusController =TextEditingController();
  final TextEditingController remarkController =TextEditingController();

@override
  void initState() {
    super.initState();
    // Set the initial values for the controllers
    taskIdController.text = widget.tasks['task_id'] ?? '';
  projectIdControler.text = widget.tasks['project_id'] ?? '';
  moduleIdController.text = widget.tasks['module_id'] ?? '';
  startDateController.text = widget.tasks['startdate'] ?? '';
  endDateController.text = widget.tasks['enddate'] ?? '';
  actualStartDateController.text = widget.tasks['actualstartdate'] ?? '';
  actualEndDateController.text = widget.tasks['actualenddate'] ?? '';
  plannedEffortController.text = widget.tasks['plannedeffort'] ?? '';
  actualEffortController.text = widget.tasks['actualeffort'] ?? '';
  statusController.text = widget.tasks['status'] ?? '';
  remarkController.text = widget.tasks['remark'] ?? '';
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
  title: Text('Task Details'),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.edit), // Use the edit icon or choose the one you prefer
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>TaskCreate(taskupdate: widget.tasks), // Replace with your update form page
          ),
        );
      },
    ),
  ],
),
body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: taskIdController,
              decoration: InputDecoration(labelText: 'task ID', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
             /* validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
            TextFormField(
              controller: projectIdControler,
              decoration: InputDecoration(labelText: 'projectID',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
             /* validator: (value) {
                if(value == null || value.isEmpty){
                 return 'please enter the projectID';
                }
                return null;
              },*/
            ),
            TextFormField(
              controller: moduleIdController,
              decoration: InputDecoration(labelText: 'moduleID',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
            /*  validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the moduleID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller: startDateController,
              decoration: InputDecoration(labelText: 'start date',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller:endDateController,
              decoration: InputDecoration(labelText: 'end date',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller: actualStartDateController,
              decoration: InputDecoration(labelText: 'actual start date',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
             TextFormField(
              controller: actualEndDateController,
              decoration: InputDecoration(labelText: 'actual end date',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
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
              decoration: InputDecoration(labelText: 'planned effort',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
              /*validator: (value) {
               if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
            TextFormField(
              controller:actualEffortController,
              decoration: InputDecoration(labelText: 'actual effort',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
             /* validator: (value) {
                if(value == null || value.isEmpty){
                  return 'please enter the taskID';
                }
                return null;
              },*/
            ),
          /*   Row(
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
             ),*/
              TextFormField(
              controller:statusController,
              decoration:InputDecoration(labelText: 'status',labelStyle: TextStyle(fontWeight: FontWeight.bold)) ,
              readOnly: true,

              ),
            TextFormField(
              controller: remarkController,
              decoration: InputDecoration(labelText: 'remark',labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              readOnly: true,
             
            ),
           
          ],
          ),
          ),
      
         ),
      ),
    );
  }
}