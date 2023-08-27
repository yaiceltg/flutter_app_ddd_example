import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// core dependencies
import 'package:app/domain/core/core.dart';
// local dependencies
import './value_objects.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();
  const factory Task({
    required UniqueId id,
    required TaskName title,
    String? description,
  }) = _Task;

  factory Task.empty() => Task(
        id: UniqueId(),
        title: TaskName(''),
        description: '',
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return title.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
