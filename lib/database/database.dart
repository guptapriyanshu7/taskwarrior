import 'package:taskwarrior/domain/project.dart';
import 'package:taskwarrior/domain/task.dart';

abstract class TaskDatabase {
  Future<void> createTask(Task task);
  Future<void> getTask(String taskId);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
}

abstract class ProjectDatabase {
  Future<void> createProject(Project project);
  Future<void> getProject(String projectId);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(String projectId);
}

class CTaskDatabase implements TaskDatabase {
  @override
  Future<void> createTask(Task task) async {}

  @override
  Future<void> deleteTask(String taskId) async {}

  @override
  Future<void> getTask(String taskId) async {}

  @override
  Future<void> updateTask(Task task) async {}
}
