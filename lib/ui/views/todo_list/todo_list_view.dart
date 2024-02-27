/*
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_stack/models/box.dart';

import '../../models/task.dart';
import 'todo_list_viewmodel.dart';

//class TodoListView extends StackedView<TodoListViewModel> {
//const TodoListView({Key? key}) : super(key: key);
class TodoListView extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
    */
/* TodoListViewModel viewModel,
    Widget? child, */ /*

  ) {
    return ViewModelBuilder<TodoListViewModel>.reactive(
      viewModelBuilder: () => TodoListViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List'),
          centerTitle: true,
        ),
        body: ListView.builder(
            //itemCount: model.tasks.length,
            itemCount: model.getTaskList()?.length,
            itemBuilder: (context, index) {
              Task tasks = model.getTaskList()![index];
              return ListTile(
                //title: Text(model.tasks[index].title),
                title: Text(tasks.title),
                leading: Checkbox(
                    //value: model.tasks[index].isCompleted,
                    value: tasks.isCompleted,
                    onChanged: (_) {
                      //model.toggleTaskStatus(index);
                      model.toggleTaskStatusHive(index);
                    }),
                trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      //model.removeTask(index);
                      model.removeTaskHive(index);
                    }),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTaskDialog(context, model);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  TodoListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodoListViewModel();
}

void _showAddTaskDialog(BuildContext context, TodoListViewModel model) {
  TextEditingController taskController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ajouter une tâche'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(labelText: 'Titre de la tâche'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Ajouter'),
            onPressed: () {
              String taskTitle = taskController.text;
              if (taskTitle.isNotEmpty) {
                //model.addTask(taskTitle);
                model.addTaskHive(taskTitle);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
*/

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_stack/models/box.dart';

import '../../models/task.dart';
import 'todo_list_viewmodel.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoListViewModel>.reactive(
      viewModelBuilder: () => TodoListViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: model.getTaskList()?.length ?? 0,
          itemBuilder: (context, index) {
            Task task = model.getTaskList()![index];
            return ListTile(
              title: Text(task.title),
              leading: Checkbox(
                value: task.isCompleted,
                onChanged: (_) {
                  model.toggleTaskStatusHive(index);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  model.removeTaskHive(index);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTaskDialog(context, model);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  TodoListViewModel viewModelBuilder(BuildContext context) =>
      TodoListViewModel();
}

void _showAddTaskDialog(BuildContext context, TodoListViewModel model) {
  TextEditingController taskController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ajouter une tâche'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(labelText: 'Titre de la tâche'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Ajouter'),
            onPressed: () {
              String taskTitle = taskController.text;
              if (taskTitle.isNotEmpty) {
                model.addTaskHive(taskTitle);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
