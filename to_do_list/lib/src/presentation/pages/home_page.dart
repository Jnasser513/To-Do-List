import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/core/presentation/designsystem/widgets/custom_fab.dart';
import 'package:to_do_list/src/data/to_do_type.dart';
import 'package:to_do_list/src/presentation/pages/widgets/home_content.dart';
import 'package:to_do_list/src/presentation/provider/to_do_provider.dart';
import 'package:to_do_list/src/data/to_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
    toDoProvider.fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ToDoProvider>(
          builder: (context, toDoProvider, child) {
            final todoList = toDoProvider.todoList;
            if (todoList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return HomeContent(todoList: todoList);
          },
        ),
      ),
      floatingActionButton: CustomFAB(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        iconData: Icons.add,
        onPressed: () {
          // Crear un ToDo "quemado"
          final newTodo = ToDo(
            id: DateTime.now().millisecondsSinceEpoch,
            title: 'Tarea de ejemplo',
            description: 'Descripción de la tarea de ejemplo',
            amount: 100.70,
            type: ToDoType.expense
          );

          // Insertar el nuevo ToDo en la base de datos
          final toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
          toDoProvider.addNewWishList(newTodo);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
