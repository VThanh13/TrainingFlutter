import 'package:code/week3/detail_photo.dart';
import 'package:code/week3/model/photos.dart';
import 'package:code/week3/network/network_request.dart';
import 'package:flutter/material.dart';


class HomeWeek3 extends StatefulWidget{
  const HomeWeek3({super.key});

  @override
  State<HomeWeek3> createState() => _HomeWeek3();
}

class _HomeWeek3 extends State<HomeWeek3>{

  List<Photos> photoData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPhotos().then((dataFromServer) => {
      setState((){
        photoData = dataFromServer;
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: photoData.length,
                  itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  DetailPhoto(photos: photoData[index])));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${photoData[index].id}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('${photoData[index].title}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  },
              ),
          ),
        ],
      ),
    );
  }
}