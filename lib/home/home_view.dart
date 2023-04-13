import 'package:code/home/detail_job.dart';
import 'package:code/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> with HomeViewModel {
  final List<HomeModel> items = [];

  void _handleAddTask(String name) {
    final newItem = HomeModel(id: DateTime.now(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id.toString() == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Image(
                        image: AssetImage('assets/logo.jpg'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 5, 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const <Widget>[
                                Text(
                                  'Nguyễn Văn Thành',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Team Fresher',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  'thanhnv3@runsystem.net',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('assets/avatar.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: items
                      .map((item) => _HomeBody(
                    item: item,
                    deleteTask: _handleDeleteTask,
                  ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return BottomView(addTask: _handleAddTask);
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  _HomeBody({Key? key, required this.item, required this.deleteTask})
      : super(key: key);
  dynamic item;
  final Function deleteTask;

  get job => null;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            print('tapne');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailJob(item: item.id, item2: item.name)
            ));
            },
          child: Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    //overflow: TextOverflow.ellipsis,
                    //overflow: TextOverflow.fade,
                  ),),
                    InkWell(
                      onTap: () async {
                        if (await confirm(context)) {
                          deleteTask(item.id.toString());
                        }
                        return;
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomView extends StatelessWidget with HomeViewModel {
  BottomView({Key? key, required this.addTask}) : super(key: key);
  final Function addTask;
  final TextEditingController _addController = TextEditingController();
  void _addTask(BuildContext context) {
    final name = _addController.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: _addController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your task',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _addTask(context),
                child: const Text('ADD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
