import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/task.dart';


//Criando classe para controlar a lista de chamados
class TaskController extends ChangeNotifier {

  //Criando variavel e igualando a uma lista vazia
  List<Task> _list = [];

  //Criando um get para que a lista possa ser acessada de fora do provider
  List<Task> get tasks => _list;

  //CREATE = Criando função para add informações na lista
  //Passando como parametro o que será adicionado quando a função add for chamada
  add(int number, String name, String description, String sector, String applicant) {
    //acessando a lista e usando um metodo da lista
    _list.add(
      //acessando a classe Task que foi criada em models
      Task(
        number: number, 
        name: name, 
        description: description, 
        sector: sector, 
        applicant: applicant
      )
    );
    notifyListeners();
  }

  //READ = Criando uma função para percorrer toda a lista
  read() {
    //condição para percorrer toda a lista
    for(int index = 0; _list.length > index; index++){
      //mostrar na tela todas as informações da lista
      log(_list[index].toString());
    }
  }

  //UPDATE = Criando uma função para editar informações da lista
  //Passando como parametro uma variavel do tipo Task
  update(Task updatedTask) {
    //Criando uma variavel index e igualando a lista acessando o index e fazendo uma verificação do index
    int index = _list.indexWhere((task) => updatedTask.number == task.number);
    //acessando o index da lista e igualando ele as novas informações
    _list[index] = updatedTask;
  }
  //DELETE = Criando uma função para deletar algo da lista
  //Passando como parametro uma variavel do tipo Task
  delete(Task removedTask) {
    //criando uma variavel index e igualando a lista acessando o index e fazendo uma verificação do index
    int index = _list.indexWhere((task) => removedTask.number == task.number);
    //acessando a lista e usando uma metodo de list para remover pelo index
    _list.removeAt(index);
  }
}