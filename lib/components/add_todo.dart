// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {

  final String title;
  final String labelTask;
  final String hintTask;
  final String labelDate;
  final String hintDate;
  final void Function(String task, String date) submit;

  const AddTodo({
    Key? key,
    required this.title,
    required this.labelTask,
    required this.hintTask,
    required this.labelDate,
    required this.hintDate,
    required this.submit,
  }) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final _formKey = GlobalKey<FormState>();
  late String task;
  late String date;

  void _submit() {
    if(!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    widget.submit(
      task,
      date
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.labelTask,
                hintText: widget.hintTask
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Este campo não pode ser vazio";
                }
                return null;
              },
              onSaved: (newValue) {
                task = newValue!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.labelDate,
                hintText: widget.hintDate
              ),
               validator: (value) {
                if(value == DateFormat("y MM dd").toString()) {
                  return "Informe uma data válida";
                }
                return null;
              },
              onSaved: (newValue) {
                date = newValue!;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _submit();
          }, 
          child: const Text("Confirmar")
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text("Cancelar")
        )
      ],
    );
  }
}
