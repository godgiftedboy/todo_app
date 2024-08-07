import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ap/models/todo.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(TodoModel todo) {
    if (!state.contains(todo)) {
      state = [...state, todo];
    }
  }

  void removeTodo(TodoModel todo) {
    state = state.where((element) => element != todo).toList();
  }
}
