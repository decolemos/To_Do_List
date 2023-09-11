import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/add_todo.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/providers/todo_list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-Do List"
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) {
                  return AddTodo(
                    submit: (task, date) {
                      Provider.of<TodoListProvider>(context, listen: false).addTodo(
                        task, 
                        date
                      );
                    },
                    title: "Adicionar tarefas",
                    labelTask: "Tarefa", 
                    hintTask: "Informe uma tarefa", 
                    labelDate: "Data", 
                    hintDate: "Informe data de conclusão"
                  );
                },
              );
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: provider.todoList.isEmpty
      ? const Center(
        child: Text("Lista Vazia"),
      )
      : ListView.builder(
        itemCount: provider.todoList.length,
        itemBuilder: (context, index) {
          return Task(
            todo: provider.todoList[index],
            taskTitle: provider.todoList[index].name,
            taskDate: provider.todoList[index].date,
          );
        },
      )
    );
  }
}