import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/data/to_do_type.dart';
import 'package:to_do_list/src/presentation/provider/to_do_provider.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'package:to_do_list/src/core/presentation/designsystem/widgets/custom_icon_button.dart';
import 'package:intl/intl.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  _AddToDoState createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  ToDoType selectedType = ToDoType.income;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2024), 
      lastDate: DateTime(2100),
    );
    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIconButton(
                foregroundColor: Theme.of(context).colorScheme.primary,
                iconData: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Ingreso'),
                      leading: Radio<ToDoType>(
                        value: ToDoType.income,
                        groupValue: selectedType,
                        onChanged: (ToDoType? value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Gasto'),
                      leading: Radio<ToDoType>(
                        value: ToDoType.expense,
                        groupValue: selectedType,
                        onChanged: (ToDoType? value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (selectedDate != null)
                    Text(
                      "Fecha: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}",
                    ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                      foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background)
                    ),
                    onPressed: () => _selectDate(context),
                    child: Text(
                      selectedDate != null
                          ? "Cambiar fecha"
                          : "Elegir Fecha"
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                      foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background),
                    ),
                    onPressed: () {
                      // Validar que los campos no estén vacíos
                      if (titleController.text.isEmpty || 
                          descriptionController.text.isEmpty || 
                          amountController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, completa todos los campos.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      // Validar que el monto sea un número válido
                      final amount = double.tryParse(amountController.text);
                      if (amount == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, ingresa un monto válido.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      // Crear el nuevo ToDo
                      final newToDo = ToDo(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: titleController.text,
                        description: descriptionController.text,
                        amount: amount,
                        type: selectedType,
                        date: selectedDate?.toIso8601String(),
                      );

                      final toDoProvider = Provider.of<ToDoProvider>(context, listen: false);
                      toDoProvider.addToDoToList(newToDo);
                      Navigator.pop(context);
                    },
                    child: const Text('Agregar Tarea'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
