import 'package:app/domain/core/core.dart';
import 'package:dartz/dartz.dart';

class TaskName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TaskName(String input) {
    return TaskName._(
      // add task name validation here, for now just return the input value
      validateStringNotEmpty(input.trim()),
    );
  }

  const TaskName._(this.value);
}
