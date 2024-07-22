import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();// Create the form as a StatefulWidget. This allows you to create a
                                          // unique GlobalKey<FormState>() once. You can then store it as a variable and access it at different points.
                                          // If you made this a StatelessWidget, you'd need to store this key somewhere. As it is resource expensive,
                                          // you wouldn't want to generate a new GlobalKey each time you run the build method.
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(// The Form widget acts as a container for grouping and validating multiple form fields. Create the form as a StatefulWidget.
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
                  onSaved: (value) {
                    _title = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a title';
                    return null;
                  }),
              const SizedBox(height: 16.0),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: 4,
                  onSaved: (value) {
                    _description = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a description';
                    return null;
                  }),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.of(context).pop(Task(title: _title, description: _description, isCompleted: false));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
