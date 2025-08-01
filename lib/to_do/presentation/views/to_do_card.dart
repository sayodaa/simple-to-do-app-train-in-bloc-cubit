import 'package:flutter/material.dart';
import 'package:to_do_app/to_do/data/models/task_model.dart';
import 'package:to_do_app/to_do/presentation/logic/bloc/task_bloc.dart';

class ToDoCard extends StatelessWidget {
  final TaskModel task;
  final int index;
  final TaskBloc bloc;

  const ToDoCard({
    super.key,
    required this.task,
    required this.index,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Checkbox(
            value: task.isCompleted,
            activeColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              bloc.add(ToggleTaskEvent(id: task.id));
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: task.isCompleted ? Colors.grey : Colors.black87,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => bloc.add(RemoveTaskEvent(id: task.id)),
            tooltip: 'حذف المهمة',
          ),
          onTap: () {
            // cubit.toggleTask(task.id);
          },
        ),
      ),
    );
  }
}