import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ap/models/todo.dart';
import 'package:todo_ap/pages/homepage.dart';
import 'package:todo_ap/providers/todo_provider.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
