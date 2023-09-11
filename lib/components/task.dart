// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/add_todo.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/providers/todo_list_provider.dart';

class Task extends StatefulWidget {


  final Todo todo;
  final String taskTitle;
  final String taskDate;

  const Task({
    Key? key,
    required this.todo,
    required this.taskTitle,
    required this.taskDate,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    return Card(
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTodo(
              submit: (task, date) {
                Provider.of<TodoListProvider>(context, listen: false).editTodo(
                  widget.todo.id, 
                  task,
                  date
                );
              },
              title: "Editar",
              labelTask: "Editar tarefa", 
              hintTask: "Edite aqui o titulo da sua tarefa", 
              labelDate: "Editar data", 
              hintDate: "Edite aqui a data da sua tarefa"
            ),
          ));
        },
        leading: Checkbox(
          value: isChecked, 
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        title: Text(widget.taskTitle),
        subtitle: Text(widget.taskDate.toString()),
        trailing: IconButton(
          onPressed: () {
            provider.removeTodo(widget.todo.id);
          }, 
          icon: const Icon(Icons.delete)
        )
      ),
    );
  }
}
