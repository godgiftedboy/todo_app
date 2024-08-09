import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ap/models/todo.dart';
import 'package:todo_ap/services/db_service.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  final DatabaseService dbProvider;
  TodoNotifier(this.dbProvider) : super([]);

  void loadTodo(List<TodoModel> todos) {
    state = todos;
  }

  void addTodo(TodoModel todo) {
    if (!state.contains(todo)) {
      state = [...state, todo];
      dbProvider.saveList("todoList", TodoModel.todoListToJson(state));
    }
  }

  void removeTodo(TodoModel todo) {
    state = state.where((element) => element != todo).toList();
    dbProvider.saveList("todoList", TodoModel.todoListToJson(state));
  }
}
