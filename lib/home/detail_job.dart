import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailJob extends StatefulWidget{
  @override
  _DetailJob createState() => _DetailJob(item: item, item2: item2, item3: item3);
  final DateTime item;
  final String item2;
  final String item3;
  const DetailJob({Key? key, required this.item, required this.item2, required this.item3}): super(key: key);
  
}

class _DetailJob extends State<DetailJob>{
  dynamic item;
  dynamic item2;
  dynamic item3;

  _DetailJob({required this.item, required this.item2, required String this.item3});
  final TextEditingController _jobNameController = TextEditingController();
  final TextEditingController _jobTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Stack(
             children: <Widget>[
               Container(
                 height: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   boxShadow: const [BoxShadow(
                     color: Colors.black26,
                     offset: Offset(0, 2),
                     blurRadius: 6,
                   )],
                 ),
                 child: ClipRRect(
                   borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),
                       bottomLeft: Radius.circular(30)),
                   child: Image(
                     image: AssetImage(item3 ?? 'assets/avatar.jpg'),
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                 child: Row(
                   children: <Widget>[
                     IconButton(
                       onPressed: () => Navigator.pop(context),
                       icon: const Icon(Icons.arrow_back),
                       iconSize: 40,
                       color: Colors.black,
                     )
                   ],
                 ),

               ),
             ],
           ),
           const Padding(padding: EdgeInsets.only(bottom: 20)),
           Container(
             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
             child: TextField(
               readOnly: true,
               controller: _jobNameController
                 ..text = item2,
               decoration: InputDecoration(
                   labelText: "Mô tả chi tiết",
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