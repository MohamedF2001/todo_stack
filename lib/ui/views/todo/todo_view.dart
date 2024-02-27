import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_stack/models/todo.dart';

import 'todo_viewmodel.dart';

class TodoView extends StackedView<TodoViewModel> {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TodoViewModel viewModel,
    Widget? child,
  ) {
    TextEditingController titleController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TO DO LIST"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Title'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.addTo(titleController);
                          titleController.clear();
                          titleController.dispose();
                          viewModel.notifyListeners();
                        },
                        child: const Text("Add"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: viewModel.getTodoList().length,
                      itemBuilder: (context, index) {
                        Todo todo = viewModel.getTodoList()[index];
                        return ListTile(
                          focusColor: Colors.amber,
                          title: Text(todo.title),
                          leading: IconButton(
                            onPressed: () {
                              viewModel.deleteOne(index);
                              viewModel.notifyListeners();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                viewModel.clearAl();
                viewModel.notifyListeners();
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Supprimer tout'),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }

  @override
  TodoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodoViewModel();
}
