import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String description,
    required DateTime createdAt,
    required int urgency,
    @Default(true) bool isPending,
    String? dependsOnTaskId,
    String? projectId,
    DateTime? due,
    DateTime? updatedAt,
  }) = _Task;
}
