import 'package:code/week6/demo_sqflite/controllers/job_controllers.dart';
import 'package:code/week6/demo_sqflite/models/job.dart';
import 'package:flutter/material.dart';

class AddJob extends StatefulWidget{
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob>{

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _validateName = false;
  bool _validatePeople = false;
  bool _validateDescription = false;

  final _jobController = JobController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SQLite CRUD'),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Add new todo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _nameController,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter job name',
                    errorText: _validateName ? 'Value can\'t be null' : null,
                    labelStyle: const TextStyle(
                      color: Colors.teal
                    ),
                    labelText: 'Name',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal
                      ),
                    ),
                  ),
                ),const SizedBox(height: 20,),
                TextField(
                  controller: _peopleController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter people todo',
                    errorText: _validatePeople ? 'Value can\'t be null' : null,
                    labelStyle: const TextStyle(
                        color: Colors.teal
                    ),
                    labelText: 'People',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal
                      ),
                    ),
                  ),
                ),const SizedBox(height: 20,),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter job description',
                    errorText: _validateDescription ? 'Value can\'t be null' : null,
                    labelStyle: const TextStyle(
                        color: Colors.teal
                    ),
                    labelText: 'Description',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    TextButton(
                    onPressed: () async {
                      setState(() {
                        _nameController.text.isEmpty? _validateName = true : _validateName = false;
                        _peopleController.text.isEmpty? _validatePeople = true : _validatePeople = false;
                        _descriptionController.text.isEmpty? _validateDescription = true : _validateDescription = false;
                      });
                      if(_validateName==false && _validatePeople==false && _validateDescription==false){
                        var job = Job();
                        job.name = _nameController.text;
                        job.people = _peopleController.text;
                        job.description = _descriptionController.text;
                        var result = await _jobController.saveJob(job);
                        if (!mounted) return;
                        Navigator.pop(context, result);
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15)
                    ),
                    child: const Text('Save'),
                    ),
                    const SizedBox(width: 20,),
                    TextButton(
                      onPressed: (){
                        _nameController.text = '';
                        _descriptionController.text = '';
                        _peopleController.text = '';
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
                          textStyle: const TextStyle(fontSize: 15)
                      ),
                      child: const Text('Clear'),
                    ),
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