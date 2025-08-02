import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/to_do/presentation/logic/bloc/task_bloc.dart';
import 'package:to_do_app/to_do/presentation/views/to_do_card.dart';

class ToDoHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  ToDoHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              final bloc = context.read<TaskBloc>();
              return Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'أدخل مهمة جديدة',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add, color: Colors.teal),
                        onPressed: () {
                          bloc.add(AddTaskEvent(title: _controller.text.trim()));
                          _controller.clear();
                        },
                      ),
                    ),
                    onSubmitted: (_) {
                      bloc.add(AddTaskEvent(title: _controller.text.trim()));
                      _controller.clear();
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return ToDoCard(
                          task: state.tasks[index],
                          index: index,
                          bloc: bloc,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
