import 'package:code/home/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_view.dart';

class DetailJob extends StatefulWidget{
  @override
  _DetailJob createState() => _DetailJob(item: item, item2: item2);
  final DateTime item;
  final String item2;
  const DetailJob({Key? key, required this.item, required this.item2}): super(key: key);
  
}

class _DetailJob extends State<DetailJob>{
  var item;
  var item2;

  _DetailJob({required this.item, required this.item2});
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _jobTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text(
           'Chi tiết công việc',
           textAlign: TextAlign.start,
           style: TextStyle(fontSize: 20),
         ),
       ),
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Padding(padding: EdgeInsets.only(bottom: 20)),
           Container(
             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
             child: TextField(
               readOnly: true,
               controller: _jobTimeController
               ..text = DateFormat('dd/MM/yyyy').format(item),
               decoration: InputDecoration(
                 labelText: "Ngày thêm",
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(
                     color: Colors.lightBlueAccent,
                     width: 1,
                   ),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderRadius:
                     BorderRadius.circular(10),
                   borderSide: const BorderSide(
                     color: Colors.blueAccent,
                     width: 4,
                   )
                 )
               ),

             ),
           ),
           Container(
             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
             child: TextField(
               readOnly: true,
               controller: _jobNameController
                 ..text = item2,
               decoration: InputDecoration(
                   labelText: "Nội dung công việc",
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(
                       color: Colors.lightBlueAccent,
                       width: 1,
                     ),
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderRadius:
                       BorderRadius.circular(10),
                       borderSide: const BorderSide(
                         color: Colors.blueAccent,
                         width: 4,
                       ),
                   ),
               ),
               maxLines: 10,

             ),
           ),
         ],
       ),
     ),
     );

  }
}