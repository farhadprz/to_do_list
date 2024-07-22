import 'package:flutter/material.dart';
import 'package:to_do_list/screens/task_details_screen.dart';

import '../models/task.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggleCompletion;

  const TaskListWidget({super.key, required this.tasks, required this.onToggleCompletion});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              task.title,
              style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(task.description),
            trailing: Checkbox(
              onChanged: (value) {
                onToggleCompletion(index);
              },
              value: task.isCompleted,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TaskDetailsScreen(task: task)));
            },
          ),
        );
      },
      itemCount: tasks.length,
    );
  }
}
