import 'package:code/week6/demo_sqflite/controllers/job_controllers.dart';
import 'package:code/week6/demo_sqflite/views/add_job.dart';
import 'package:code/week6/demo_sqflite/views/view_job.dart';
import 'package:flutter/material.dart';

import '../models/job.dart';
import 'edit_job.dart';

class HomeSQLWeek6 extends StatefulWidget{
  const HomeSQLWeek6({super.key});

  @override
  State<HomeSQLWeek6> createState() => _HomeSQLState();

}

class _HomeSQLState extends State<HomeSQLWeek6>{
  //List<Job>? _jobList;
  late  List<Job> _jobList = <Job>[];
  final _jobController = JobController();

  getAllJobDetails() async{
    var jobs = await _jobController.readAllJob();

    _jobList = <Job>[];
    jobs.forEach((job){
      setState(() {
        var jobModel =  Job();
        jobModel.id = job['id'];
        jobModel.name = job['name'];
        jobModel.people = job['people'];
        jobModel.description = job['description'];
        _jobList.add(jobModel);
      });
    });
  }

  _showSuccessSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
    );
  }

  _deleteFormDialog(BuildContext context, jobId){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        title: const Text('Are you sure to delete?',
        style: TextStyle(
          fontSize: 20,
          color: Colors.teal,
        ),),
        actions: [
          TextButton(
            onPressed: () async{
              var result = await _jobController.deleteJob(jobId);
              if(result!=null){
                if (!mounted) return;
                  Navigator.pop(context);

                getAllJobDetails();
                _showSuccessSnackBar('Delete job success');
              }
            },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
          ),
              child: const Text('Delete'),),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.teal,
            ),
            child: const Text('Close'),),
        ],
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllJobDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey[300],
        child: ListView.builder(
            itemCount: _jobList.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ViewJob(job: _jobList[index])));
                  },
                  leading: const Icon(Icons.work),
                  title: Text(_jobList[index].name ?? ''),
                  subtitle: Text(_jobList[index].people ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => EditJob(job: _jobList[index]))).then((data){
                              if(data!=null){
                                getAllJobDetails();
                                _showSuccessSnackBar('Update job success');
                              }
                            });

                          }, icon: const Icon(Icons.edit, color: Colors.tealAccent,),),
                      IconButton(
                        onPressed: (){
                          _deleteFormDialog(context, _jobList[index].id);

                        }, icon: const Icon(Icons.delete, color: Colors.redAccent,),),
                    ],
                  ),
                ),
              );

            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const  AddJob())).then((data){
                  if(data!=null){
                    getAllJobDetails();
                    _showSuccessSnackBar('Create job success');
                  }
            });
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

}