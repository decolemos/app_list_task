import 'package:flutter/material.dart';

class FormTask extends StatefulWidget {
  const FormTask({super.key});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Chamado'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.save))
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
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Numero do chamado'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Numero do chamado'),
              ),
            ],
          )
        )
      ),
    );
  }
}