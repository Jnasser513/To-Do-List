import 'package:flutter/material.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'package:to_do_list/src/data/to_do_type.dart';
import 'package:to_do_list/src/presentation/pages/widgets/to_do_item.dart';

class HomeContent extends StatelessWidget {
  List<ToDo> todoList;

HomeContent({
  Key? key,
  List<ToDo>? todoList
  }) : todoList = todoList ?? [], super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(todoList.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Ajusta el margen según tus necesidades
                child: ToDoItem(item: todoList[index]),
              );
            }),
          ),
        ),
      );
    });
  }

}