import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {

  final String title;
  final bool isCompleted;
  final String id;

  const TaskModel({
    required this.title,
    required this.isCompleted,
    required this.id,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      id: json['id'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'id': id,
    };
  }

  TaskModel copyWith({
    String? title,
    bool? isCompleted,
    String? id,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }
  
  @override
  List<Object?> get props => [title, isCompleted, id];
}
