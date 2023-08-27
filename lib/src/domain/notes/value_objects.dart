import 'package:dartz/dartz.dart';

import '../core/core.dart';

class NoteName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteName(String input) {
    return NoteName._(
      // add note name validation here, for now just return the input value
      validateStringNotEmpty(input.trim()),
    );
  }

  const NoteName._(this.value);
}
