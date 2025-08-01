part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState({required this.tasks});

  final List<TaskModel> tasks;
  
  @override
  List<Object> get props => [tasks];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super (tasks: []);
}

final class TaskUpdated extends TaskState {
  const TaskUpdated({required super.tasks});
}
