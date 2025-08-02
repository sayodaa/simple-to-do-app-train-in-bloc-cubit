import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_do_app/to_do/data/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);
    on<RemoveTaskEvent>(_removeTask);
    on<ToggleTaskEvent>(_toggleTask);
  }

  FutureOr<void> _removeTask(event , emit){
    List<TaskModel> newList = state.tasks.where((task) => task.id != event.id).toList();
    emit(TaskUpdated(tasks: newList));
  }
  
  FutureOr<void> _addTask(event, emit) {
    final task = TaskModel(title: event.title, isCompleted: false, id: Uuid().v4());
    emit(TaskUpdated(tasks: [...state.tasks , task]));
  }

  FutureOr<void> _toggleTask(event , emit){
    List<TaskModel> newList = state.tasks.map((task){
      return task.id == event.id ? task.copyWith(isCompleted: !task.isCompleted) : task;
    }).toList();
    emit(TaskUpdated(tasks: newList));
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskUpdated(
      tasks: (json['todos'] as List).map((e) => TaskModel.fromJson(e)).toList(),
    );
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return {"todos": state.tasks.map((todo) => todo.toJson()).toList()};
  }
}
