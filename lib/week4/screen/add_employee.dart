import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddEmployee extends StatefulWidget{
  const AddEmployee({super.key,  this.todo});
  final Map? todo;

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee>{
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if(todo != null){
      isEdit = true;
      final name = todo['name'];
      final salary = todo['salary'];
      final age = todo['age'];
      nameController.text = name;
      salaryController.text = salary;
      ageController.text = age;
    }

  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  final StreamController _nameStream = StreamController.broadcast();
  final StreamController _ageStream = StreamController.broadcast();
  final StreamController _salaryStream = StreamController.broadcast();

  Stream get nameStream => _nameStream.stream;
  Stream get ageStream => _ageStream.stream;
  Stream get salaryStream => _salaryStream.stream;

  bool checkNull(String name, String age, String salary){
    if(name.isEmpty){
      _nameStream.sink.addError("Please insert name");
      return false;
    }
    _nameStream.add("");
    if(age.isEmpty){
      _ageStream.sink.addError("Please insert age");
      return false;
    }
    _ageStream.sink.add('');
    if(salary.isEmpty){
      _salaryStream.sink.addError("Please insert salary");
      return false;
    }
    _salaryStream.sink.add('');
    return true;
  }
  @override
  void dispose() {
    _nameStream.close();
    _ageStream.close();
    _salaryStream.close();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit? 'Edit employee':'Add employee'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            StreamBuilder(
              stream: nameStream,
                builder: (BuildContext context, snapshot)=>
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Name',
                        errorText: snapshot.hasError?  snapshot.error.toString() : null,
                      ),
                      controller: nameController,
                    ),
              ),
            const SizedBox(height: 20,),
            StreamBuilder(
              stream: ageStream,
                builder: (context, snapshot)=>
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Age',
                        errorText: snapshot.hasError?  snapshot.error.toString() : null,
                      ),
                      controller: ageController,
                    ),
            ),
            const SizedBox(height: 20,),
            StreamBuilder(
                stream: salaryStream,
                builder: (context, snapshot)=>
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Salary',
                        errorText: snapshot.hasError?  snapshot.error.toString() : null,
                      ),
                      controller: salaryController,
                    ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: isEdit? updateEmployee : addEmployee,
                child: Text(isEdit? 'Update':'Submit'),
            ),
          ],
        ),
      ),
    );
  }
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(content: Text(message,
      style: const TextStyle(color: Colors.white),
    ),backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> addEmployee() async{
    var url = "https://dummy.restapiexample.com/api/v1/create";
    final uri = Uri.parse(url);
    final name = nameController.text;
    final age = ageController.text;
    final salary = salaryController.text;
    final body = {
      "employee_name": name,
      "employee_salary": salary,
      "employee_age": age
    };
    var isValid = checkNull(name, age, salary);
    if(isValid){
      try{
        final response = await http.post(
            uri,
            body: jsonEncode(body));

        if(response.statusCode == 200){
          setState(() {
            nameController.text = '';
            salaryController.text = '';
            ageController.text = '';
          });
          // final responseBody = jsonDecode(response.body);
          // print(responseBody['status']);
          showSuccessMessage("Create employee success!");
        }else{
          showErrorMessage("Create employee failed");
        }
      }catch(e){
        showErrorMessage('No connect internet!');
      }
    }
  }
  Future<void> updateEmployee() async{
    final todo = widget.todo;
    final id = todo?['id'];
    final name = nameController.text;
    final age = ageController.text;
    final salary = salaryController.text;
    final body = {
      "employee_name": name,
      "employee_salary": salary,
      "employee_age": age
    };
    String url = 'https://dummy.restapiexample.com/api/v1/update/$id';
    final uri = Uri.parse(url);
    var isValid = checkNull(name, age, salary);
    if(isValid){
      try{
        final response = await http.put(
            uri,
            body: jsonEncode(body));
        if (response.statusCode == 200){
          showSuccessMessage("Update employee success");
          setState(() {
          });
        }else{
          showErrorMessage("Update employee failed");
        }
      }catch(e){
        showErrorMessage('No connect internet!');
      }
    }
  }
}