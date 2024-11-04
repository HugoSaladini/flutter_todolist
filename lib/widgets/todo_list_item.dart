import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.onDelete});

  final Todo todo;
  final Function(Todo) onDelete; // Callback para deletar o item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Slidable(
        // Define as ações ao deslizar
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.30,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25, // Ocupa 1/4 da largura da tela
              child: SlidableAction(
                onPressed: (context) {
                  onDelete(todo); // Chama a função para deletar o item
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Deletar',
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          // Ocupa toda a largura da tela
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[400],
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Exibe a data formatada
              Text(DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime)),
              // Exibe o título da tarefa
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
