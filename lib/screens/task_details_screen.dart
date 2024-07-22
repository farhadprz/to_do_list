import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          task.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Text(task.description, style: const TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
