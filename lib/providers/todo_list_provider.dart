import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TodoListProvider extends ChangeNotifier {

  final List<Todo> todoList = [];

  void addTodo(String name, String date) {
    todoList.add(Todo(
        id: Random().nextDouble().toString(),
        name: name, 
        date: date
      )
    );
  notifyListeners();
  }

  void removeTodo(String id) {
    todoList.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void editTodo(String id, String newName, String newDate) {
    int index = todoList.indexWhere((todo) => todo.id == id);

    if(index != -1) {
      todoList[index].name = newName;
      todoList[index].date = newDate;

      notifyListeners();
    }
  }

   
}