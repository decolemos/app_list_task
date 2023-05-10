import 'package:flutter/material.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import 'edit_task.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key, required this.task});

  final Task task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do chamado'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditTask(task: widget.task,),));
            }, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Text(widget.task.number.toString()),
      )
    );
  }
}