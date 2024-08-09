import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_ap/main.dart';
import 'package:todo_ap/models/todo.dart';
import 'package:todo_ap/pages/add_todo.dart';
import 'package:todo_ap/services/db_service.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});
  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  var todoListString = "";
  // var todos = [];

  @override
  void initState() {
    super.initState();
    final dbProvider = ref.read(databaseProvider);
    _loadTodoList(dbProvider);
  }

  void _loadTodoList(DatabaseService dbProvider) async {
    dbProvider.getList("todoList").then((value) {
      todoListString = value ?? "";
      List<TodoModel> todos = todoListString != ""
          ? TodoModel.todoListFromJson(todoListString)
          : [];

      // setState(() {
      ref.watch(todoProvider.notifier).loadTodo(todos);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todos"),
      ),
      body: todoList.isEmpty
          ? Center(
              child: LottieBuilder.asset("assets/not_found.json"),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  title: Text(todoList[index].title),
                  subtitle: Text(todoList[index].desc),
                  trailing: IconButton(
                      onPressed: () {
                        ref
                            .watch(todoProvider.notifier)
                            .removeTodo(todoList[index]);
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
