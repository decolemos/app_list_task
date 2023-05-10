import 'package:flutter/material.dart';
import 'package:list_tasks/pages/form_task.dart';
import 'package:list_tasks/pages/home.dart';
import 'package:list_tasks/providers/task_controller.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        routes: {
          AppRoutes.HOMEPAGE:(_) => const HomePage(),
          AppRoutes.FORM_TASK:(_) => const FormTask(),
        },
        debugShowCheckedModeBanner: false,
      )
    );
  }
}