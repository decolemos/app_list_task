import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';

class FormTask extends StatefulWidget {
  const FormTask({super.key});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {

  final _formKey = GlobalKey<FormState>();
  late int number;
  late String name;
  late String description;
  late String sector;
  late String applicant;

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Chamado'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Number: $number');
                log('Name: $name');
                log('Description: $description');
                log('Sector: $sector');
                log('applicant: $applicant');
                provider.add(number, name, description, sector, applicant);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Adicionado com sucesso'))
                );
              } 
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
                validator: (value) {

                  if(value == null || value.isEmpty){
                    return 'Informe o numero do chamado';
                  }

                  if(value.length < 6) {
                    return 'Minimo de 6 digitos';
                  }

                  try{
                    int.parse(value);
                  } catch (e){
                    return 'Valor informado não é um numero';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  log(newValue!);
                  number = int.parse(newValue);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titulo do chamado'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe o titulo do chamado';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  log(newValue!);
                  name = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição do chamado'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe a descrição do chamado';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  log(newValue!);
                  description = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Setor'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe o setor do chamado';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  log(newValue!);
                  sector = newValue;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Requerente do chamado'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe o requerente do chamado';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  log(newValue!);
                  applicant = newValue;
                },
              ),
            ],
          )
        )
      ),
    );
  }
}