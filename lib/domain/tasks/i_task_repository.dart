import './task.dart';

/// Interface for a repository that retrieves tasks.
abstract class ITaskRepository {
  ///
  /// Get tasks list
  ///
  Future<List<Task>> getTasks();

  ///
  /// Get task by id
  ///
  Future<Task> getTask(String id);

  ///
  /// Add task
  ///
  Future<void> addTask(Task task);

  ///
  /// Update task
  ///
  Future<void> updateTask(Task task);

  ///
  /// Delete task
  ///
  Future<void> deleteTask(String id);
}
