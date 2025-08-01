part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();
  
  @override
  List<Object> get props => [];
}

final class AddTaskEvent extends TaskEvent {
  final String title;

  const AddTaskEvent({required this.title});

  @override
  List<Object> get props => [title];
}

final class RemoveTaskEvent extends TaskEvent {
  final String id;

  const RemoveTaskEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class ToggleTaskEvent extends TaskEvent {
  final String id;

  const ToggleTaskEvent({required this.id});

  @override
  List<Object> get props => [id];
}
