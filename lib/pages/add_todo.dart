import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_ap/main.dart';
import 'package:todo_ap/models/todo.dart';
import 'package:todo_ap/pages/homepage.dart';
import 'package:todo_ap/pages/mixins/validator_mixin.dart';

class AddTodoPage extends ConsumerWidget with ValidatorMixin {
  AddTodoPage({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                validator: validateTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10),
                  ),
                  hintText: "title",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: descController,
                validator: validateDesc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10),
                  ),
                  hintText: "description\n\n\n",
                  hintMaxLines: 3,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ref.watch(todoProvider.notifier).addTodo(
                          TodoModel(
                            titleController.text,
                            descController.text,
                            DateTime.now(),
                          ),
                        );
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
