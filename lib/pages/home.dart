import 'package:flutter/material.dart';
import 'package:list_tasks/configs/app_routes.dart';
import 'package:list_tasks/pages/form_task.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de chamados'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.FORM_TASK
              );
            }, 
            icon: const Icon(Icons.add))
        ],
      ),
      body: provider.tasks.isEmpty ? const Center(
        child: Text('Lista Vazia'),
      )
      :
      ListView.builder(
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/logoMalwee.png'),
            title: Text(
              provider.tasks[index].number.toString()
            ),
            subtitle: Text(
              provider.tasks[index].name.toString()
            ),
          );
        },
      )
    );
  }
}