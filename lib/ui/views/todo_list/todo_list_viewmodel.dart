import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_stack/models/box.dart';
import 'package:todo_stack/ui/models/task.dart';

class TodoListViewModel extends BaseViewModel {
  List<Task> tasks = [];

  Box? boxTask;

  List<Task>? getTaskList() {
    List<Task>? taskList = boxTask?.values.cast<Task>().toList();
    return taskList;
  }

  void addTask(String title) {
    tasks.add(Task(title, false));
    notifyListeners();
  }

  /*void addTaskHive(String title) {
    boxTask?.put('key_$title', Task(title, false));
  }*/

  void toggleTaskStatus(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    notifyListeners();
  }

  /*void toggleTaskStatusHive(int index) {
    boxTask?.putAt(index, tasks[index].isCompleted);
  }*/

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  /* void removeTaskHive(int index) {
    boxTask?.deleteAt(index);
  }*/

  void addTaskHive(String title) {
    if (boxTask == null) {
      boxTask?.put('key_$title', Task(title, false));
    }
  }

  void toggleTaskStatusHive(int index) {
    if (boxTask != null && boxTask!.containsKey(index)) {
      final task = boxTask!.getAt(index);
      if (task is Task) {
        task.isCompleted = !task.isCompleted;
        boxTask!.putAt(index, task);
      }
    }
  }

  void removeTaskHive(int index) {
    if (boxTask != null && boxTask!.containsKey(index)) {
      boxTask!.deleteAt(index);
    }
  }
}
