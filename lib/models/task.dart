import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Todo {
  Todo({required this.title});

  @HiveField(0)
  String title;
}
