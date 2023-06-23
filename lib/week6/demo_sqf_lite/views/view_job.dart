import 'package:flutter/material.dart';

import '../models/job.dart';

class ViewJob extends StatefulWidget {
  final Job job;
  const ViewJob({super.key, required this.job});

  @override
  State<ViewJob> createState() => _ViewJobState();
}

class _ViewJobState extends State<ViewJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Job: ',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.job.name ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Do: ',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.job.people ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description: ',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.job.description ?? '',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
