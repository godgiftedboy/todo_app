import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_ap/main.dart';
import 'package:todo_ap/pages/add_todo.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todos"),
      ),
      body: todos.isEmpty
          ? Center(
              child: LottieBuilder.asset("assets/not_found.json"),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  title: Text(todos[index].title),
                  subtitle: Text(todos[index].desc),
                  trailing: IconButton(
                      onPressed: () {
                        ref
                            .watch(todoProvider.notifier)
                            .removeTodo(todos[index]);
                      },
                      icon: const Icon(Icons.remove)),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
