class Tasklist {
 
final   String projectId;
    final String status;
    final String taskId; 
final String moduleId;
  final String startDate;
  final String endDate;
  final String actualStartDate;
  final String actualEndDate;
  final String plannedEffort;
  final String actualEffort;

  final String remark;
  

  Tasklist({
   
    required this.projectId,
    required this.status,
    required this.taskId,
   required this.moduleId,
   required this.startDate,
    required this.endDate,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.plannedEffort,
    required this.actualEffort,
    
    required this.remark,
   
  });

  factory Tasklist.fromJson(Map<String, dynamic> json) {
    return Tasklist(
      
      projectId: json['project_id'],
      status: json['status'],
        taskId: json['task_id'],

      moduleId: json['module_id'],
    
      startDate: json['startDate'],
      endDate: json['endDate'],
      actualStartDate: json['actualStartDate'],
      actualEndDate: json['actualEndDate'],
      plannedEffort: json['plannedEffort'],
      actualEffort: json['actualEffort'],
      
      remark: json['remark'],
    );
  }
}
class Taskdetails {
 
 final int projectId;
  final String projectName;
 /* final int moduleId;
  final String startDate;
  final String endDate;
  final String actualStartDate;
  final String actualEndDate;
  final String plannedEffort;
  final String actualEffort;
  final String status;
  final String review;
  final int taskId;*/

  Taskdetails({
   
   required this.projectId,
   required this.projectName,
   /* required this.moduleId,
   required this.startDate,
    required this.endDate,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.plannedEffort,
    required this.actualEffort,
    required this.status,
    required this.review,
     required this.taskId,*/
  });

  factory Taskdetails.fromJson(Map<String, dynamic> json) {
    return Taskdetails(
      
     projectId: json['project_id'],
      projectName:json['project_name'],
      /*moduleId: json['module_id'],
      taskId: json['task_id'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      actualStartDate: json['actualStartDate'],
      actualEndDate: json['actualEndDate'],
      plannedEffort: json['plannedEffort'],
      actualEffort: json['actualEffort'],
      status: json['status'],
      review: json['review'],*/
    );
  }
}
