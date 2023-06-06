// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/employees.dart';
// import 'add_employee.dart';
//
// class Week4Home extends StatefulWidget{
//   const Week4Home({super.key});
//
//
//   @override
//   State<Week4Home> createState() => _Week4HomeState();
// }
//
// class _Week4HomeState extends State<Week4Home>{
//   bool isLoading = true;
//   List list = [];
//
//
//   @override
//   void initState() {
//     super.initState();
//     EmployeesController.getAllEmployees();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home page'),
//       ),
//       body: FutureBuilder(
//         future: EmployeesController.getAllEmployees(),
//         builder: (BuildContext context, AsyncSnapshot snapshot){
//           if(snapshot.hasData){
//             if(snapshot.data!.isNotEmpty){
//               return Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index){
//                       final item = snapshot.data![index];
//                       Map<String, String> map ={
//                         "name": item.employeeName!,
//                         "age": item.employeeSalary!.toString(),
//                         "salary": item.employeeAge!.toString(),
//                         "id": item.id!.toString(),
//                       };
//                       final id = map['id'];
//                       return Card(
//                         color: Colors.blue,
//                         child: ListTile(
//                           title: Text(snapshot.data![index].employeeName!),
//                           subtitle: Text(snapshot.data![index].employeeSalary.toString()),
//                           trailing: PopupMenuButton(
//                             onSelected: (value){
//                               if(value == 'edit'){
//                                 navigateToEdit(map);
//                               }else if(value == 'delete'){
//                                 deleteEmployee(id!);
//                               }
//                             },
//                             itemBuilder: (context){
//                               return [
//                                 const PopupMenuItem(
//                                   value: 'edit',
//                                   child: Text('Edit'),
//                                 ),
//                                 const PopupMenuItem(
//                                   value: 'delete',
//                                   child: Text('Delete'),
//                                 ),
//                               ];
//                             },
//                           ),
//                         ),
//                       );
//                     }),
//               );
//             }else{
//               return const Center(child: Text('No Data found!'));
//             }
//           }else if (snapshot.hasError){
//             return Text(snapshot.error.toString());
//           }else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//           onPressed: navigateToAdd,
//           label: const Text('Add'),
//         backgroundColor: Colors.red,
//
//       ),
//     );
//   }
//   Future<void> navigateToAdd() async{
//     final route = MaterialPageRoute(
//         builder: (context) =>  const AddEmployee());
//     await Navigator.push(context, route);
//   }
//   Future<void> navigateToEdit(Map? item) async{
//     final route = MaterialPageRoute(
//         builder: (context) =>  AddEmployee(todo: item));
//     await Navigator.push(context, route);
//   }
//   Future<void> deleteEmployee(String id) async{
//     try{
//       String url = 'https://dummy.restapiexample.com/api/v1/delete/$id';
//       final uri = Uri.parse(url);
//       final response = await http.delete(uri);
//       if(response.statusCode == 200){
//         setState(() {
//           showSuccessMessage("Delete employee success");
//         });
//       }else{
//         showErrorMessage("Delete Employee failed");
//       }
//     }catch(e){
//       showErrorMessage('No connect internet!');
//     }
//
//
//   }
//   void showSuccessMessage(String message) {
//     final snackBar = SnackBar(content: Text(message));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   void showErrorMessage(String message) {
//     final snackBar = SnackBar(content: Text(message,
//       style: const TextStyle(color: Colors.white),
//     ),backgroundColor: Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//   Future<void> fetchEmployee() async{
//     list = await EmployeesController.getAllEmployees() as List;
//   }
//
// }
//
// class EmployeesController{
//   static Future<List<Data>?> getAllEmployees() async{
//     String url = 'https://dummy.restapiexample.com/api/v1/employees';
//     List<Data> result = [];
//     try{
//       Dio dio = Dio();
//       DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
//       Options myOptions = buildCacheOptions(const Duration(days: 30),
//       forceRefresh: true);
//       dio.interceptors.add(dioCacheManager.interceptor);
//
//       var res = await dio.get(url, options: myOptions);
//       result = getList(res.data);
//
//     }catch (e){
//       if (e is SocketException){
//         return null;
//       }
//     }
//     return result;
//   }
//   static getList(body) {
//     List<Data> emp = [];
//     List x = (body)['data'];
//     for (var element in x) {
//       emp.add(Data.fromJson(element));
//     }
//     return emp;
//   }
// }