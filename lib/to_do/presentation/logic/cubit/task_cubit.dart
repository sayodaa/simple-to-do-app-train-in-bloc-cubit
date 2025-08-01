import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/to_do/data/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  void addTask({required String title}){
  final task = TaskModel(title: title, isCompleted: false, id: Uuid().v4());
  emit(TaskUpdated(tasks: [...state.tasks , task])); //!append end

  //! emit(TaskUpdated(tasks: [task , ...state.tasks , task])); //append start & end
  //! emit(TaskUpdated(tasks:List.from(state.tasks)..add(task)));
  }

  void removeTask(String id){
    List<TaskModel> newList = state.tasks.where((task) => task.id != id).toList();
  emit(TaskUpdated(tasks: newList));
  }

  void toggleTask(String id){
    List<TaskModel> newList = state.tasks.map((task){
      return task.id == id ? task.copyWith(isCompleted: !task.isCompleted) :  task;
    }).toList();
    emit(TaskUpdated(tasks: newList));
  }
}
