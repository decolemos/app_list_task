import 'package:flutter/material.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key, required this.task});

  final Task task;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  // late dynamic task;

  final _formKey = GlobalKey<FormState>();
 
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _sectorController = TextEditingController();
  final _applicantController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberController.text = widget.task.number.toString();
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Numero do chamado'),
                controller: _numberController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titulo do chamado'),
                controller: _nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição do chamado'),
                controller: _descriptionController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Setor do chamado'),
                controller: _sectorController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Requerente do chamado'),
                controller: _applicantController,
              ),
              ElevatedButton(
                onPressed: () => provider.update(
                  Task(
                    id: widget.task.id, 
                    number: int.parse(_numberController.text), 
                    name: _nameController.text, 
                    description: _descriptionController.text, 
                    sector: _sectorController.text, 
                    applicant: _applicantController.text
                    )
                  ), 
                child: const Text('Comfirmar')
              )
            ],
          )
        ),
      )
    );
  }
}