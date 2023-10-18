# from flask import Flask, render_template, request
from models import app, db, Project, Module, Task
from flask import render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
# from views import 
from datetime import datetime
from flask_cors import cross_origin
# app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.errorhandler(404)
def not_found(e):
    return render_template('index.html')


###########################################################################
################ADDING DATA TO THE DATABASE - VIEW.PY ##################################


###### Adding Project Data to DB ##################################

@app.route('/create_project', methods=['POST'])
@cross_origin()
def create_project():
    project_name = request.form['project_name']
    project_start_date = request.form['project_start_date']
    project_end_date = request.form['project_end_date']
    # project_actual_start_date = request.form['project_actual_start_date']
    # project_actual_end_date = request.form['project_actual_end_date']

    project = Project(project_name, project_start_date, project_end_date)
    db.session.add(project)
    db.session.commit()

    success_data = {
        "code" : 200,
        "message" : "success",
        'project_id': int(project.ProjectID),
    }
    return success_data

@cross_origin()
@app.route('/create_module', methods=['POST'])
def create_module():
    module_name=request.form['module_name']
    project_id=request.form['project_id']

    module=Module(module_name,project_id)
    db.session.add(module)
    db.session.commit()

    success_data={
        "code" : 200,
        "message" : "success",
        "module_id": int(module.ModuleID)
    }
    return success_data


# /create_task/<int:pid>/<int:mid>
@app.route('/create_task',methods=['POST'])
@cross_origin()
def create_task():
     assigned_user=request.form['assignedUser']
     startdate=request.form['startDate']
     enddate=request.form['endDate']
    #  actualstartdate=request.form['actualstartdate']
    #  actualenddate=request.form['actualenddate']
     plannedEffort=request.form['plannedEffort']
    #  actualeffort=request.form['actualeffort']
     status=request.form['status']
     remark=request.form['remark']

     task=Task(assigned_user,startdate,enddate,plannedEffort,status,remark)
     db.session.add(task)
     db.session.commit()

     success_data = {
         "code" : 200,
         "message" : "success",
     }

     return success_data

#########################################################################################
########################## Fetching data from DB to view ################################
#########################################################################################

#################### For viewing all the Project Data in a page ##############################

@app.route('/view_project',methods=['GET'])
@cross_origin()
def view_project():
    project_view = Project.query.all()
    result = [
    {
        "project_id" : view.ProjectID,
        "project_name" : view.ProjectName,
    }
    for view in project_view]

  
    return jsonify(result)
  


@app.route('/project/<int:projectId>',methods=['GET'])
def project(projectId):
    return {"projectId":projectId}

@app.route('/view_module/<int:pid>',methods=['GET'])
def module(pid):
    module_view=Module.query.get(ProjectId=pid)
    result = [
    {
        "module_id" : view.ModuleId,
        "module_name" : view.ModuleName

    }
    for view in module_view]
    return jsonify(result)
    # return render_template('.html',module=result)

@app.route('/task_view',methods=['GET'])
@cross_origin()
def task_view ():
    
  #  task_view=Task.query.get(ProjectId=pid,ModuleId=mid)
    task_view=Task.query.all()
    result = [
        {
            "task_id" : view.TaskID,
            "project_id":view.ProjectID,
            "module_id": view.ModuleID,
           # "assigneduser" : view.AssignedUser,
            "startdate" : view.StartDate,
            "enddate" : view.EndDate,
            "actualstartdate" : view.ActualStartDate,
            "actualenddate" : view.ActualEndDate,
            "plannedeffort" : view.PlannedEffort,
            "actualeffort" : view.ActualEffort,
            "status" : view.Status,
            "remark" : view.Remark
        }
    for view in task_view] 
    return jsonify(result)
    # return render_template('.html',Task=result)

############################################################################
#############################   Updates  ###################################
############################################################################

# @app.route('/update_project/<int:pid>',methods=['PUT'])
# def update_project(pid):
#     project_name = request.form['project_name']
#     project_start_date = request.form['project_start_date']
#     project_end_date = request.form['project_end_date']
#     project_actual_start_date = request.form['project_actual_start_date']
#     project_actual_end_date = request.form['project_actual_end_date']

#     project = Project(project_name, project_start_date, project_end_date)
#     db.session.update(project)
#     db.session.commit()

#     success_data = {
#         "code" : 200,
#         "message" : "success",
#     }
#     return success_data

@app.route('/update_project/<int:pid>',methods=['PUT'])
def update_start_end_date(pid):
    actual_start_date = request.form[''] #need to finish
    actual_end_date = request.form[''] #need to finish

    get_project_id = Project.query.filter_by(project_id = pid)
    if get_project_id:
        get_project_id.ActualProjectStartDate = actual_start_date
        get_project_id.ActualProjectEndDate = actual_end_date
        db.session.commit()
        return f"""
        <script> alert('Date updated succesfully');
        """
    else:
        return f"""
        <script> alert('The project do not exist');
        """
    
@app.route('/update_task/<int:tid>')
def update_task(tid):
    actual_start_date = request.form[''] #need to finish
    actual_end_date = request.form[''] #need to finish
    actual_effort = request.form[''] #need to finish
    status = request.form[''] #need to finish
    remark = request.form[''] #need to finish

    task_update = Task.query.filter_by(task_id = tid)
    if task_update:
        task_update.ActualStartDate = actual_start_date
        task_update.ActualEndDate = actual_end_date
        task_update.ActualEffort = actual_effort
        task_update.Status = status
        task_update.Remark = remark








############################################################################
with app.app_context():
    db.create_all()




if __name__ == '__main__':
    app.run(debug=True)