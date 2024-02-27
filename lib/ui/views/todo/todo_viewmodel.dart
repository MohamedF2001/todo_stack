import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_stack/models/box.dart';
import 'package:todo_stack/models/todo.dart';

class TodoViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();

  addTodo() {
    // Vérifier si les champs sont vides avant d'ajouter
    if (titleController.text.isNotEmpty) {
      boxTodo.put(
        'key_$titleController',
        Todo(title: titleController.text),
      );
      // Effacer les champs après avoir ajouté une tâche
      titleController.clear();

      notifyListeners();
    }
  }

  addTo(TextEditingController titleController) {
    if (titleController.text.isEmpty) {
      return SnackBar(
        content: Text("data"),
      );
    } else {
      return boxTodo.put(
        'key_$titleController',
        Todo(title: titleController.text),
      );
    }
  }

  deleteOne(int index) {
    return boxTodo.deleteAt(index);
  }

  clearAl() => boxTodo.clear();

  List<Todo> getTodoList() {
    List<Todo> todoList = boxTodo.values.cast<Todo>().toList();
    return todoList;
  }

  List<Widget> buildListTiles(List<Todo> todos) {
    List<Widget> tiles = [];

    for (int index = 0; index < todos.length; index++) {
      Todo todo = todos[index];
      tiles.add(
        ListTile(
          title: Text(todo.title),
          leading: IconButton(
            onPressed: () {
              boxTodo.deleteAt(index);
              notifyListeners();
            },
            icon: const Icon(Icons.remove),
          ),
        ),
      );
    }
    return tiles;
  }

// ListTile buildListTile(Todo todo) {
//   return ListTile(
//     title: Text(todo.title),
//     subtitle: Text(todo.subtitle),
//     leading: IconButton(
//       onPressed: () {},
//       icon: const Icon(Icons.remove),
//     ),
//   );
//   notifyListeners();
// }
}
