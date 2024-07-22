import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/screens/add_task_screen.dart';
import 'package:to_do_list/widgets/task_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [Task(title: 'title', description: 'description', isCompleted: true)];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text(
              'No tasks available, Add dome tasks!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ))
          : TaskListWidget(
              tasks: _tasks,
              onToggleCompletion: _toggleTaskCompletion,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () async {
          final result =
              await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddTaskScreen()));
          if (result != null) {
            _addTask(result);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
