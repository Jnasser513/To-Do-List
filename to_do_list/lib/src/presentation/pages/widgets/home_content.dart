import 'package:flutter/material.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'package:to_do_list/src/data/to_do_type.dart';
import 'package:to_do_list/src/presentation/pages/widgets/to_do_item.dart';

class HomeContent extends StatelessWidget {
  final List<ToDo> items = [
    ToDo(
      id: 1,
      title: 'prueba 1',
      description: 'description 1',
      amount: 3100.70,
      type: ToDoType.expense
    ),
    ToDo(
      id: 2,
      title: 'prueba 2',
      description: 'description 2',
      amount: 543100.70
    ),
    ToDo(
      id: 3,
      title: 'prueba 3',
      description: 'description 3',
      amount: 75100.70
    ),
    ToDo(
      id: 4,
      title: 'prueba 4',
      description: 'description 4',
      amount: 234100.70
    ),
    ToDo(
      id:5,
      title: 'prueba 5',
      description: 'description 5',
      amount: 100324.70
    ),
    ToDo(
      id: 6,
      title: 'prueba 6',
      description: 'description 6',
      amount: 1010.70
    ),
  ];

HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(items.length, (index) => ToDoItem(item: items[index])),
          ),
          ),
      );
    });
  }
}