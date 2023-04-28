import 'package:code/week3/model/photos.dart';
import 'package:flutter/material.dart';

class DetailPhoto extends StatefulWidget{
  const DetailPhoto({Key? key, required this.photos}): super(key: key);
  final Photos photos;

  @override
  State<DetailPhoto> createState() => _DetailPhotoState();
}

class _DetailPhotoState extends State<DetailPhoto>{

  late Photos photos;
  @override
  void initState(){
    super.initState();
    photos = widget.photos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 400,
                  width: double.infinity,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    child: Image.network('${photos.url}'),
                  ),
                ),

                Positioned(
                  top: 55,
                  child: Padding(padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text('Album ${photos.albumId}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),),
            ),
            const SizedBox(height: 5,),
            Container( 
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text('Photo: ${photos.id}',
                style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              ),
            ),

            const SizedBox(height: 5,),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text('${photos.title}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}