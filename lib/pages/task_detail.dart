import 'package:flutter/material.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {

  late dynamic task;

  @override
  void initState() {
    super.initState();
    Provider.of<TaskController>(context).read();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do chamado'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Text(),
          )
        ],
      )
    );
  }
}