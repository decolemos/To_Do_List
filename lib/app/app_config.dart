import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/todo_list_provider.dart';
import 'package:todo_list/screens/home_page.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}