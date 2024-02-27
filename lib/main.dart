import 'package:flutter/material.dart';
import 'package:todo_stack/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_stack/models/box.dart';
import 'package:todo_stack/models/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_stack/ui/models/task.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();*/
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  boxTodo = await Hive.openBox<Todo>('todoBox');
  boxTask = await Hive.openBox<Task>('taskBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: Routes.startupView,
      initialRoute: Routes.todoView,
      //initialRoute: Routes.todoListView,
      //initialRoute: Routes.textReverseView,
      //initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
