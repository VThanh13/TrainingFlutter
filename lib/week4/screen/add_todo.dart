import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatefulWidget{
  const AddTodo({super.key, this.todo});
  final Map? todo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo>{

  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if(todo != null){
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text(isEdit? 'Edit Todo':'Add Todo')
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Title'
              ),
              controller: titleController,
            ),
            const SizedBox(height: 20,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              controller: descriptionController,
              maxLines: 10,
              minLines: 5,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: isEdit? updateData :submitData,
              child: Text(isEdit? 'Update': 'Submit'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateData() async{
    final todo = widget.todo;
    final id = todo?['_id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
        uri,
    body: jsonEncode(body),
    headers: {
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200){
      showSuccessMessage("Update Success");
    }else{
      showErrorMessage("Update Failed");
    }


  }
  Future<void> submitData() async{
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    var url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201){
      titleController.text ='';
      descriptionController.text = '';
      showSuccessMessage("Creation Success");
    }else{
      showErrorMessage("Creation Failed");
    }
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
}