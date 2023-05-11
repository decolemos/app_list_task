import 'package:flutter/material.dart';
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
      body: Padding(padding: const EdgeInsets.all(5),
        child: ListTile(
          title: Column(
            children: [
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Numero do chamado: ${widget.task.number.toString()}'
                    )
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Titulo do chamado: ${widget.task.name}'
                    )
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Descrição do chamado: ${widget.task.description}'
                    )
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Setor do chamado: ${widget.task.sector}'
                    )
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Requerente do chamado: ${widget.task.applicant}'
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}